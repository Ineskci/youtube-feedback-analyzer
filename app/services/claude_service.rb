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
      You are a senior product manager analyzing #{total} YouTube comments. Return ONLY valid JSON with this exact structure:

      {
        "pain_points": [
          {
            "title": "...",
            "description": "...",
            "count": 0,
            "percentage": 0,
            "severity": 8,
            "business_impact": "HIGH",
            "verbatims": ["exact quote 1", "exact quote 2"],
            "recommended_action": "Specific action to fix this"
          }
        ],
        "feature_requests": [
          {
            "title": "...",
            "description": "...",
            "votes": 0,
            "percentage": 0,
            "priority": "Critical",
            "sentiment": "positive"
          }
        ],
        "sentiment": { "positive": 0, "neutral": 0, "negative": 0 },
        "recommended_actions": [
          {
            "action": "...",
            "rationale": "...",
            "priority": "high",
            "group": "sprint_1",
            "team": "...",
            "timeline": "2 weeks",
            "success_metric": "..."
          }
        ],
        "summary": "..."
      }

      Rules:
      - pain_points: top 5 problems, each with:
          * count: estimated mentions; percentage: count/#{total}*100 (integer)
          * severity: integer 1-10 (10 = most severe, based on frequency × frustration)
          * business_impact: "HIGH" (churn/revenue risk), "MEDIUM" (UX degradation), or "LOW"
          * verbatims: 2 short exact quotes from the comments
          * recommended_action: one concrete fix action
      - feature_requests: top 5, sorted by votes desc; percentage: votes/#{total}*100 (integer)
          * priority: "Critical" / "Quick Win" / "Nice to Have"
          * sentiment: "positive" (enthusiastic) or "negative" (frustrated)
      - recommended_actions: top 5-8 PM actions grouped by:
          * group: "sprint_1" (urgent, <2 weeks), "sprint_2" (quick wins, <1 month), "strategic" (>1 month), or "deprioritize"
          * team: which team owns this (e.g. "Mobile Engineering", "Marketing", "Hardware")
          * timeline: specific estimate (e.g. "2 weeks", "1 month", "6 months")
          * success_metric: one measurable outcome (e.g. "Transfer failure rate <5%")
      - sentiment: percentages totaling 100
      - summary: 2-3 sentences, C-level ready
      - Always respond in English

      Comments:
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
