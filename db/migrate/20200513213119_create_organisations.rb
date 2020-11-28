# frozen_string_literal: true

class CreateOrganisations < ActiveRecord::Migration[5.2]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :description
      t.string :logo_link

      t.timestamps
    end
  end
end
