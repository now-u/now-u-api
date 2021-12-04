class AddStatusToCampaign < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :status, :integer, default: 0
  end
end
