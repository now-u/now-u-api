class CreatePressCoverageArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :press_coverage_articles do |t|
      t.string :image_url
      t.string :link
      t.string :media_name
      t.timestamps
    end
  end
end
