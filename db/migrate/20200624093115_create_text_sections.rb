# frozen_string_literal: true

class CreateTextSections < ActiveRecord::Migration[5.2]
  def change
    create_table :text_sections do |t|
      t.text :content
      t.integer :blog_article_id
      t.integer :appearance_order
      t.timestamps
    end
  end
end
