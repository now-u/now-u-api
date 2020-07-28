class AddInfographicUrlToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :infographic_url, :string
  end
end
