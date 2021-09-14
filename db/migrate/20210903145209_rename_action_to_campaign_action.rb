class RenameActionToCampaignAction < ActiveRecord::Migration[5.2]
  def change
    rename_table :actions, :campaign_actions
  end
end
