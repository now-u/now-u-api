class MigrationLearningResourcesRequiredFields < ActiveRecord::Migration[5.2]
  def change
    change_column_null :learning_resources, :title, false, ""
    change_column_null :learning_resources, :time, false, 0
    change_column_null :learning_resources, :link, false, ""
    change_column_null :learning_resources, :type, false, ""
    change_column_null :learning_resources, :source, false, ""
    change_column_null :learning_resources, :created_at, false
    change_column_null :learning_resources, :updated_at, false
  end
end
