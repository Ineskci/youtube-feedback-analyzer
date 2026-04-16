class ClaudeService
  def initialize
    @client = Anthropic::Client.new(access_token: ENV["ANTHROPIC_API_KEY"])
  end

  # Analyse le sentiment par mois à partir de commentaires groupés
  # comments_by_month : { "2026-01" => ["comment1", ...], ... }
  # Retourne : [{ month: "Jan 2026", positive: 60, neutral: 20, negative: 20 }, ...]
  def analyze_sentiment_timeline(comments_by_month)
    return [] if comments_by_month.empty?

    prompt = build_timeline_prompt(comments_by_month)

    response = @client.messages(
      parameters: {
        model: "claude-haiku-4-5-20251001",
        max_tokens: 4096,
        messages: [{ role: "user", content: prompt }]
      }
    )

    raw_text = response.dig("content", 0, "text").gsub(/\A```json\s*|\s*```\z/, "").strip
    JSON.parse(raw_text)
  rescue JSON::ParserError
    []
  end

  # Analyse une liste de commentaires et retourne un hash structuré
  def analyze_comments(comments)
    prompt = build_prompt(comments)

    response = @client.messages(
      parameters: {
        model: "claude-haiku-4-5-20251001",
        max_tokens: 4096,
        messages: [{ role: "user", content: prompt }]
      }
    )

    raw_text = response.dig("content", 0, "text")
    parse_response(raw_text)
  end

  private

  def build_timeline_prompt(comments_by_month)
    months_text = comments_by_month.map do |month, comments|
      "Month #{month} (#{comments.size} comments):\n" +
      comments.first(50).map.with_index(1) { |c, i| "  #{i}. #{c}" }.join("\n")
    end.join("\n\n")

    <<~PROMPT
      You are a product feedback analyst. Analyze the sentiment of these YouTube comments grouped by month.

      Return ONLY a valid JSON array with this exact structure:
      [
        { "month": "Jan 2026", "positive": 60, "neutral": 20, "negative": 20 }
      ]

      Rules:
      - One entry per month, sorted chronologically
      - positive + neutral + negative must total 100
      - Format month as "Mon YYYY" (e.g. "Apr 2026")
      - Always respond in English

      #{months_text}

      Respond ONLY with the JSON array, no text before or after.
    PROMPT
  end

  def build_prompt(comments)
    total = comments.size
    comments_text = comments.first(200).map.with_index(1) { |c, i| "#{i}. #{c}" }.join("\n")

    <<~PROMPT
      You are a product feedback analyst. Analyze these #{total} YouTube comments and return ONLY a valid JSON with this exact structure:

      {
        "pain_points": [
          {
            "title": "...",
            "description": "...",
            "count": 0,
            "percentage": 0,
            "severity": 4,
            "verbatims": ["exact quote from a comment", "another exact quote"]
          }
        ],
        "feature_requests": [
          { "title": "...", "description": "...", "votes": 0, "percentage": 0, "priority": "Critical", "sentiment": "positive" }
        ],
        "sentiment": {
          "positive": 0,
          "neutral": 0,
          "negative": 0
        },
        "recommended_actions": [
          { "action": "...", "rationale": "...", "priority": "high" }
        ],
        "summary": "..."
      }

      Rules:
      - pain_points: top 5 recurring problems, each with:
          * count: estimated number of mentions
          * percentage: count / #{total} * 100, rounded to nearest integer
          * severity: integer 1-5 (5 = most severe, based on frequency + frustration level)
          * verbatims: 2 short exact quotes from the comments that illustrate this pain point
      - feature_requests: top 5 requests, sorted by votes descending, each with:
          * votes: estimated number of mentions
          * percentage: votes / #{total} * 100, rounded to nearest integer
          * priority: "Critical" (many mentions + frustration), "Quick Win" (easy + high demand), or "Nice to Have"
          * sentiment: "positive" (enthusiastic) or "negative" (frustrated)
      - recommended_actions: top 3 actionable next steps for a PM, each with:
          * action: clear directive (e.g. "Fix file transfer reliability")
          * rationale: one sentence explaining why (based on data)
          * priority: "high", "medium", or "low"
      - sentiment: percentages that must total 100
      - summary: executive summary in 2-3 sentences
      - Always respond in English, regardless of the comments language

      Comments to analyze:
      #{comments_text}

      Respond ONLY with the JSON, no text before or after.
    PROMPT
  end

  def parse_response(text)
    clean = text.gsub(/\A```json\s*|\s*```\z/, "").strip
    JSON.parse(clean)
  rescue JSON::ParserError
    json_match = text.match(/\{.*\}/m)
    json_match ? JSON.parse(json_match[0]) : {}
  end
end
