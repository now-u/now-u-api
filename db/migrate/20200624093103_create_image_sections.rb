class CreateImageSections < ActiveRecord::Migration[5.2]
  def change
    create_table :image_sections do |t|
      t.string :img_url
      t.integer :blog_id
      t.integer :appearance_order
      t.timestamps
    end
  end
end