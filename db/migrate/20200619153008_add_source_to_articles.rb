# frozen_string_literal: true

class AddSourceToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :source, :string
  end
end
