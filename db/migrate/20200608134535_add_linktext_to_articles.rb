# frozen_string_literal: true

class AddLinktextToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :link_text, :string
  end
end
