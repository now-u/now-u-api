# frozen_string_literal: true

class AddTitleToTextSections < ActiveRecord::Migration[5.2]
  def change
    add_column :text_sections, :title, :string
  end
end
