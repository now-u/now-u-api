class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :blog_article_id
      t.timestamps
    end
  end
end
