# frozen_string_literal: true

class AddTimeFieldToActions < ActiveRecord::Migration[5.2]
  def change
    add_column :actions, :time, :float
  end
end
