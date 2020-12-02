# frozen_string_literal: true

class CreateCampaignGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign_goals do |t|
      t.integer :campaign_id
      t.integer :goal_id

      t.timestamps
    end
  end
end
