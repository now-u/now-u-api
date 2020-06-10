class RemoveFieldsFromOrganisations < ActiveRecord::Migration[5.2]
  def change
    remove_column :organisations, :type, :string
    remove_column :organisations, :twitter_text, :string
    add_column :organisations, :organisation_type, :string
  end
end
