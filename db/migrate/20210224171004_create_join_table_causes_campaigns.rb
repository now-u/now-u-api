class CreateJoinTableCausesCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_join_table :causes, :campaigns do |t|
      # t.index [:cause_id, :campaign_id]
      # t.index [:campaign_id, :cause_id]
    end
  end
end
