class MigrationActionsRequiredFields < ActiveRecord::Migration[5.2]
  def change
    change_column_null :campaign_actions, :title, false, ""
    change_column_null :campaign_actions, :link, false, ""
    change_column_null :campaign_actions, :type, false, ""
    change_column_null :campaign_actions, :what_description, false, ""
    change_column_null :campaign_actions, :why_description, false, ""
    change_column_null :campaign_actions, :time, false, 0

    change_column_null :campaign_actions, :of_the_month, false, false
    change_column_null :campaign_actions, :recommended, false, false
    change_column_null :campaign_actions, :enabled, false, false
    change_column_default :campaign_actions, :of_the_month, false
    change_column_default :campaign_actions, :recommended, false
  end
end
