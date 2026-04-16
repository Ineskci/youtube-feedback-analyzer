class YoutubeService
  MAX_COMMENTS = 500

  def initialize
    @service = Google::Apis::YoutubeV3::YouTubeService.new
    @service.key = ENV["YOUTUBE_API_KEY"]
  end

  # Récupère le titre, thumbnail et nom de la chaîne d'une vidéo
  # Retourne un hash { title:, thumbnail:, channel_name: }
  def fetch_video_metadata(video_id)
    response = @service.list_videos("snippet", id: video_id)
    video = response.items.first
    return {} if video.nil?

    {
      title: video.snippet.title,
      thumbnail: video.snippet.thumbnails.medium&.url || video.snippet.thumbnails.default&.url,
      channel_name: video.snippet.channel_title
    }
  end

  # Récupère jusqu'à 500 commentaires avec leur date
  # Retourne un tableau de hashes { text:, date: }
  def fetch_comments(video_id)
    comments = []
    next_page_token = nil

    loop do
      response = @service.list_comment_threads(
        "snippet",
        video_id: video_id,
        max_results: 100,
        page_token: next_page_token,
        text_format: "plainText"
      )

      response.items.each do |item|
        snippet = item.snippet.top_level_comment.snippet
        comments << {
          text: snippet.text_display,
          date: snippet.published_at&.strftime("%Y-%m-%d")
        }
        break if comments.size >= MAX_COMMENTS
      end

      next_page_token = response.next_page_token
      break if next_page_token.nil? || comments.size >= MAX_COMMENTS
    end

    comments
  rescue Google::Apis::ClientError => e
    raise VideoNotFoundError if e.status_code == 404
    raise CommentsDisabledError if e.message.include?("commentsDisabled")
    raise QuotaExceededError if e.status_code == 403
    raise e
  rescue Faraday::TimeoutError, Net::OpenTimeout
    raise TimeoutError
  end

  # Custom errors — chaque cas d'erreur a son propre type pour les gérer séparément
  class VideoNotFoundError < StandardError; end
  class CommentsDisabledError < StandardError; end
  class QuotaExceededError < StandardError; end
  class TimeoutError < StandardError; end

  # Extrait l'ID d'une URL YouTube (ex: https://youtube.com/watch?v=abc123 → "abc123")
  def self.extract_video_id(url)
    uri = URI.parse(url)
    if uri.host&.include?("youtu.be")
      uri.path.delete_prefix("/")
    else
      Rack::Utils.parse_query(uri.query || "")["v"]
    end
  rescue URI::InvalidURIError
    nil
  end
end
