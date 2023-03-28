class CreateCampaignLearningResources < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign_learning_resources do |t|
      t.references :campaign, foreign_key: true
      t.references :learning_resource, foreign_key: true

      t.timestamps
    end
  end
end
