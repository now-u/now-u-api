class ChangeCampaignDescriptions < ActiveRecord::Migration[5.2]
  def change
    rename_column :campaigns, :description, :description_app
    add_column :campaigns, :description_web, :text
  end
end
