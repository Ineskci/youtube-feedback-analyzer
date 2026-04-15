class CreateAnalyses < ActiveRecord::Migration[8.1]
  def change
    create_table :analyses do |t|
      t.string :video_url
      t.string :video_id
      t.text :comments
      t.string :status

      t.timestamps
    end
  end
end
