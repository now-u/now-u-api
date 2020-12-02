# frozen_string_literal: true

class CreateUserActions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_actions do |t|
      t.integer :user_id
      t.integer :action_id
      t.string :status

      t.timestamps
    end
  end
end
