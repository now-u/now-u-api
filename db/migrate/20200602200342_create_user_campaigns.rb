# frozen_string_literal: true

class CreateUserCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :user_campaigns do |t|
      t.integer :user_id
      t.integer :campaign_id

      t.timestamps
    end
  end
end
