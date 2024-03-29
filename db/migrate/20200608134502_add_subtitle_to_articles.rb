# frozen_string_literal: true

class AddSubtitleToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :subtitle, :string
  end
end
