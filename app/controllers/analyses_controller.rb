class AnalysesController < ApplicationController
  def new
    @analysis = Analysis.new
  end

  def create
    video_id = YoutubeService.extract_video_id(params[:analysis][:video_url])

    if video_id.nil?
      @analysis = Analysis.new(video_url: params[:analysis][:video_url])
      @analysis.errors.add(:video_url, "URL YouTube invalide")
      render :new, status: :unprocessable_entity and return
    end

    youtube = YoutubeService.new
    comments = youtube.fetch_comments(video_id)

    ai_result = ClaudeService.new.analyze_comments(comments)

    @analysis = Analysis.new(
      video_url: params[:analysis][:video_url],
      video_id: video_id,
      status: "completed"
    )
    @analysis.comments_array = comments
    @analysis.ai_analysis_hash = ai_result
    @analysis.save!

    redirect_to analysis_path(@analysis)
  end

  def show
    @analysis = Analysis.find(params[:id])
  end
end
