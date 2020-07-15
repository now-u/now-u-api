class AddSectionTypeToTextSections < ActiveRecord::Migration[5.2]
  def change
    add_column :text_sections, :section_type, :string, default: 'text_section'
  end
end
