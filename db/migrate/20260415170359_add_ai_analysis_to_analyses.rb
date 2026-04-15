class AddAiAnalysisToAnalyses < ActiveRecord::Migration[8.1]
  def change
    add_column :analyses, :ai_analysis, :text
  end
end
