class SplitDescriptionField < ActiveRecord::Migration[5.2]
  def change
    remove_column :actions, :description, :string
    add_column :actions, :what_description, :string
    add_column :actions, :why_description, :string
  end
end
