class ClaudeService
  def initialize
    @client = Anthropic::Client.new(access_token: ENV["ANTHROPIC_API_KEY"])
  end

  # Analyse une liste de commentaires et retourne un hash structuré
  def analyze_comments(comments)
    prompt = build_prompt(comments)

    response = @client.messages(
      parameters: {
        model: "claude-opus-4-6",
        max_tokens: 2048,
        messages: [{ role: "user", content: prompt }]
      }
    )

    raw_text = response.dig("content", 0, "text")
    parse_response(raw_text)
  end

  private

  def build_prompt(comments)
    comments_text = comments.first(200).map.with_index(1) { |c, i| "#{i}. #{c}" }.join("\n")

    <<~PROMPT
      Tu es un expert en analyse de feedback produit. Analyse ces #{comments.size} commentaires YouTube et retourne UNIQUEMENT un JSON valide avec cette structure exacte :

      {
        "pain_points": [
          { "title": "...", "description": "...", "count": 0 }
        ],
        "feature_requests": [
          { "title": "...", "description": "...", "votes": 0 }
        ],
        "sentiment": {
          "positive": 0,
          "neutral": 0,
          "negative": 0
        },
        "summary": "..."
      }

      Règles :
      - pain_points : top 5 problèmes récurrents avec leur fréquence estimée
      - feature_requests : top 5 demandes de fonctionnalités
      - sentiment : pourcentages (doivent totaliser 100)
      - summary : résumé exécutif en 2-3 phrases

      Commentaires à analyser :
      #{comments_text}

      Réponds UNIQUEMENT avec le JSON, sans texte avant ou après.
    PROMPT
  end

  def parse_response(text)
    JSON.parse(text)
  rescue JSON::ParserError
    # Si Claude renvoie du texte autour du JSON, on l'extrait
    json_match = text.match(/\{.*\}/m)
    json_match ? JSON.parse(json_match[0]) : {}
  end
end
