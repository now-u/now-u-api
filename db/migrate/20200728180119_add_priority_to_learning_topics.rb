class AddPriorityToLearningTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :learning_topics, :priority, :integer, default: 0
  end
end
