class AddProgressFieldToUserCampaign < ActiveRecord::Migration[5.2]
  def change
    add_column :user_campaigns, :progress, :integer, default: 0
  end
end
