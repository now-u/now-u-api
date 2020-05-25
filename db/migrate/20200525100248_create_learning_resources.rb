class CreateLearningResources < ActiveRecord::Migration[5.2]
  def change
    create_table :learning_resources do |t|
      t.string :title
      t.float :time
      t.string :link
      t.string :type
      t.integer :learning_topic_id

      t.timestamps
    end
  end
end
