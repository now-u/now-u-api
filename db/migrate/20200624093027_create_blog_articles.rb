class CreateBlogArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_articles do |t|
      t.string :title
      t.string :subtitle
      t.integer :action_id
      t.integer :user_id
      t.integer :campaign_id
      t.integer :reading_time
      t.timestamps
    end
  end
end