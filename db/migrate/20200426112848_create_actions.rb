# frozen_string_literal: true

class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :type
      t.integer :campaign_id

      t.timestamps
    end
  end
end
