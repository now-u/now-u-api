class AddFieldsToOrganisations < ActiveRecord::Migration[5.2]
  def change
    add_column :organisations, :type, :string
    add_column :organisations, :IG_link, :string
    add_column :organisations, :FB_link, :string
    add_column :organisations, :twitter_text, :string
    add_column :organisations, :twitter_link, :string
    add_column :organisations, :extra_text_1, :string
    add_column :organisations, :extra_text_2, :string
    add_column :organisations, :extra_text_3, :string
    add_column :organisations, :extra_link_1, :string
    add_column :organisations, :extra_link_2, :string
    add_column :organisations, :extra_link_3, :string
  end
end
