class AddEndDateToActionsAndLearningResources < ActiveRecord::Migration[5.2]
  def change
    add_column :actions, :end_date, :datetime
    add_column :learning_resources, :release_date, :datetime
    add_column :learning_resources, :end_date, :datetime
  end
end
