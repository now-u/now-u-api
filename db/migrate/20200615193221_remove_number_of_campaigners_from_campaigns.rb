# frozen_string_literal: true

class RemoveNumberOfCampaignersFromCampaigns < ActiveRecord::Migration[5.2]
  def change
    remove_column :campaigns, :number_of_campaigners, :integer
  end
end
