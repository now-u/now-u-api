# frozen_string_literal: true

class AddShortNameToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :short_name, :string
  end
end
