class AddHeaderImageToBlogArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_articles, :header_image, :string
  end
end
