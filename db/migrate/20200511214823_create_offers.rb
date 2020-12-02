# frozen_string_literal: true

class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.string :link
      t.integer :campaign_id

      t.timestamps
    end
  end
end
