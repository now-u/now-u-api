class AddSectionTypeToImageSections < ActiveRecord::Migration[5.2]
  def change
    add_column :image_sections, :section_type, :string, default: 'image_section'
  end
end
