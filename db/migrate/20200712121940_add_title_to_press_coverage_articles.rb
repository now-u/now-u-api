# frozen_string_literal: true

class AddTitleToPressCoverageArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :press_coverage_articles, :title, :string
  end
end
