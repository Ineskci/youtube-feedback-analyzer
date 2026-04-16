class AddSentimentTimelineToAnalyses < ActiveRecord::Migration[8.1]
  def change
    add_column :analyses, :sentiment_timeline, :text
  end
end
