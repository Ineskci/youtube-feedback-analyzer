class YoutubeService
  MAX_COMMENTS = 500

  def initialize
    @service = Google::Apis::YoutubeV3::YouTubeService.new
    @service.key = ENV["YOUTUBE_API_KEY"]
  end

  # Récupère jusqu'à 500 commentaires pour une vidéo donnée
  # Retourne un tableau de strings (texte des commentaires)
  def fetch_comments(video_id)
    comments = []
    next_page_token = nil

    loop do
      response = @service.list_comment_threads(
        "snippet",
        video_id: video_id,
        max_results: 100,          # max autorisé par appel API
        page_token: next_page_token,
        text_format: "plainText"
      )

      response.items.each do |item|
        comments << item.snippet.top_level_comment.snippet.text_display
        break if comments.size >= MAX_COMMENTS
      end

      next_page_token = response.next_page_token
      break if next_page_token.nil? || comments.size >= MAX_COMMENTS
    end

    comments
  end

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
