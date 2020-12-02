# frozen_string_literal: true

class AddSubtitleToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :subtitle, :text
  end
end
