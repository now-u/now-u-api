class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :header_image
      t.string :full_article_link
      t.string :video_link
      t.integer :action_id
      t.integer :campaign_id

      t.timestamps
    end
  end
end
