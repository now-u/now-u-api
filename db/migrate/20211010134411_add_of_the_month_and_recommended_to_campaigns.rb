class AddOfTheMonthAndRecommendedToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :of_the_month, :boolean
    add_column :campaigns, :recommended, :boolean
  end
end
