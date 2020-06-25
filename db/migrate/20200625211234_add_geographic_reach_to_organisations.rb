class AddGeographicReachToOrganisations < ActiveRecord::Migration[5.2]
  def change
    add_column :organisations, :geographic_reach, :string
  end
end
