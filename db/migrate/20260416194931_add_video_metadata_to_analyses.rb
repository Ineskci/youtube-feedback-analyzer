class AddVideoMetadataToAnalyses < ActiveRecord::Migration[8.1]
  def change
    add_column :analyses, :video_title, :string
    add_column :analyses, :video_thumbnail, :string
    add_column :analyses, :channel_name, :string
  end
end
