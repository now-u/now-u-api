# frozen_string_literal: true

class AddExtraFieldsToOrganisations < ActiveRecord::Migration[5.2]
  def change
    add_column :organisations, :email, :string
    add_column :organisations, :website, :string
  end
end
