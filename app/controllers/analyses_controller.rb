class AnalysesController < ApplicationController
  def index
    @analyses = Analysis.order(created_at: :desc)
  end

  def new
    @analysis = Analysis.new
  end

  def create
    video_id = YoutubeService.extract_video_id(params[:analysis][:video_url])

    if video_id.nil?
      @analysis = Analysis.new(video_url: params[:analysis][:video_url])
      @analysis.errors.add(:video_url, "That doesn't look like a YouTube URL. Try: youtube.com/watch?v=...")
      return render :new, status: :unprocessable_entity
    end

    youtube = YoutubeService.new
    metadata = youtube.fetch_video_metadata(video_id)
    comments = youtube.fetch_comments(video_id)

    claude = ClaudeService.new
    ai_result = claude.analyze_comments(comments.map { |c| c[:text] || c })

    @analysis = Analysis.new(
      video_url: params[:analysis][:video_url],
      video_id: video_id,
      video_title: metadata[:title],
      video_thumbnail: metadata[:thumbnail],
      channel_name: metadata[:channel_name],
      status: "completed"
    )
    @analysis.comments_array = comments
    @analysis.ai_analysis_hash = ai_result
    @analysis.save!

    redirect_to analysis_path(@analysis)

  rescue YoutubeService::VideoNotFoundError
    render_error "We couldn't find this video. Check the URL or try a different one."
  rescue YoutubeService::CommentsDisabledError
    render_error "Comments are disabled on this video. Try a different one."
  rescue YoutubeService::QuotaExceededError
    render_error "We've hit YouTube's daily limit. Come back tomorrow to run more analyses."
  rescue YoutubeService::TimeoutError
    render_error "This is taking longer than expected. Please try again in a moment."
  rescue Anthropic::Error, Faraday::Error
    render_error "The analysis didn't complete. Please try again — it usually works on the second attempt."
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  private

  def render_error(message)
    @analysis = Analysis.new(video_url: params.dig(:analysis, :video_url))
    @analysis.errors.add(:base, message)
    render :new, status: :unprocessable_entity
  end
end
