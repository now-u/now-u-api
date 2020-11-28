# frozen_string_literal: true

class AddCodeToOrganisations < ActiveRecord::Migration[5.2]
  def change
    add_column :organisations, :code, :string
  end
end
