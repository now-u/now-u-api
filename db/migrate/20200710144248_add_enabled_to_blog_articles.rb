# frozen_string_literal: true

class AddEnabledToBlogArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_articles, :enabled, :boolean, default: false
  end
end
