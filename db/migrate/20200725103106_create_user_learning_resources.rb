# frozen_string_literal: true

class CreateUserLearningResources < ActiveRecord::Migration[5.2]
  def change
    create_table :user_learning_resources do |t|
      t.integer :user_id
      t.integer :learning_resource_id

      t.timestamps
    end
  end
end
