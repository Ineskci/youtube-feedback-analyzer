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
      @analysis.errors.add(:video_url, "Invalid YouTube URL. Please use a URL like https://www.youtube.com/watch?v=...")
      return render :new, status: :unprocessable_entity
    end

    youtube = YoutubeService.new
    metadata = youtube.fetch_video_metadata(video_id)
    comments = youtube.fetch_comments(video_id)

    ai_result = ClaudeService.new.analyze_comments(comments)

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
    render_error "Video not found. It may have been deleted or the URL is incorrect."
  rescue YoutubeService::CommentsDisabledError
    render_error "Comments are disabled on this video."
  rescue YoutubeService::QuotaExceededError
    render_error "YouTube API quota exceeded. Please try again tomorrow."
  rescue YoutubeService::TimeoutError
    render_error "The request timed out. Please try again."
  rescue Anthropic::Error, Faraday::Error => e
    render_error "AI analysis failed. Please try again. (#{e.class})"
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
