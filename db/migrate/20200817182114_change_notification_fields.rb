# frozen_string_literal: true

class ChangeNotificationFields < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :title, :string
    add_column :notifications, :image, :string
    add_column :notifications, :body, :text
    remove_column :notifications, :text
  end
end
