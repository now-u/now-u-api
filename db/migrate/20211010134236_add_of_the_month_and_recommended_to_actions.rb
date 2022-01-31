class AddOfTheMonthAndRecommendedToActions < ActiveRecord::Migration[5.2]
  def change
    add_column :campaign_actions, :of_the_month, :boolean
    add_column :campaign_actions, :recommended, :boolean
  end
end
