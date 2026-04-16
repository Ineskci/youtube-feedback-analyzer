class Analysis < ApplicationRecord
  validates :video_url, presence: true

  # Statuts possibles : pending → processing → completed / failed
  STATUSES = %w[pending processing completed failed].freeze

  # Les commentaires sont stockés en JSON dans la colonne text
  def comments_array
    return [] if comments.blank?
    JSON.parse(comments)
  end

  def comments_array=(array)
    self.comments = array.to_json
  end

  # Retourne les résultats Claude sous forme de hash Ruby
  def ai_analysis_hash
    return {} if ai_analysis.blank?
    JSON.parse(ai_analysis)
  rescue JSON::ParserError
    {}
  end

  def ai_analysis_hash=(hash)
    self.ai_analysis = hash.to_json
  end

  # Retourne uniquement les textes (compatible ancien et nouveau format)
  def comments_texts
    comments_array.map { |c| c.is_a?(Hash) ? c["text"] : c }
  end

  # Retourne les commentaires groupés par mois { "2026-01" => ["comment1", ...] }
  def comments_by_month
    comments_array
      .select { |c| c.is_a?(Hash) && c["date"].present? }
      .group_by { |c| c["date"][0..6] }
      .transform_values { |comments| comments.map { |c| c["text"] } }
  end

  def sentiment_timeline_data
    return [] if sentiment_timeline.blank?
    JSON.parse(sentiment_timeline)
  rescue JSON::ParserError
    []
  end

  def sentiment_timeline_data=(array)
    self.sentiment_timeline = array.to_json
  end
end
