# frozen_string_literal: true

class SetBooleansDefaultFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:campaigns, :enabled, false)
    change_column_default(:actions, :enabled, false)
    change_column_default(:articles, :enabled, false)
  end
end
