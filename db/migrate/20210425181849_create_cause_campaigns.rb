class CreateCauseCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :cause_campaigns do |t|
      t.references :cause, index: true, null: false, foreign_key: { to_table: :causes }
      t.references :campaign, index: true, null: false, foreign_key: { to_table: :campaigns }

      t.timestamps
    end
  end
end
