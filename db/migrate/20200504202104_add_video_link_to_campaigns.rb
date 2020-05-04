class AddVideoLinkToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :video_link, :string
  end
end
