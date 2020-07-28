class AddSourceToLearningResources < ActiveRecord::Migration[5.2]
  def change
    add_column :learning_resources, :source, :string
  end
end
