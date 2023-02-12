class MigrationCampaignRequiredFields < ActiveRecord::Migration[5.2]
  def change
    change_column_null :campaigns, :title, false, ""
    change_column_null :campaigns, :description_app, false, ""
    change_column_null :campaigns, :short_name, false, ""
    change_column_null :campaigns, :of_the_month, false, false
    change_column_null :campaigns, :recommended, false, false
    change_column_null :campaigns, :enabled, false, true 
    change_column_null :campaigns, :status, false, 0 
  end
end
