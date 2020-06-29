class CreateBlogTags < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_tags do |t|
      t.integer :blog_article_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
