class RenameActionIdForeignKey < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :action_id, :campaign_action_id
    rename_column :blog_articles, :action_id, :campaign_action_id
    rename_column :cause_actions, :action_id, :campaign_action_id
    rename_column :offers, :action_id, :campaign_action_id
    rename_column :user_actions, :action_id, :campaign_action_id
  end
end
