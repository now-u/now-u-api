# frozen_string_literal: true

class CreateUserNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_notifications do |t|
      t.integer :user_id
      t.integer :notification_id
      t.boolean :dismissed, default: false

      t.timestamps
    end
  end
end
