class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.integer :number_of_campaigners
      t.string :header_image

      t.timestamps
    end
  end
end
