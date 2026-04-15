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
end
