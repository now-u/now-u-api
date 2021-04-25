class CreateCauses < ActiveRecord::Migration[5.2]
  def change
    create_table :causes do |t|
      t.string :image
      t.string :icon
      t.string :name
      t.string :description
      t.integer :joiners

      t.timestamps
    end
  end
end
