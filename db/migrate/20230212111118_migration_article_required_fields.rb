class MigrationArticleRequiredFields < ActiveRecord::Migration[5.2]
  def change
    change_column_null :articles, :title, false, ""
    change_column_null :articles, :subtitle, false, ""
    change_column_null :articles, :full_article_link, false, ""
    change_column_null :articles, :enabled, false, true
  end
end
