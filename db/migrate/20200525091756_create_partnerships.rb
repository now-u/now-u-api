# frozen_string_literal: true

class CreatePartnerships < ActiveRecord::Migration[5.2]
  def change
    create_table :partnerships do |t|
      t.integer :campaign_id
      t.integer :organisation_id
      t.string :type

      t.timestamps
    end
  end
end
