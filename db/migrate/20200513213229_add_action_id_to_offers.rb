# frozen_string_literal: true

class AddActionIdToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :action_id, :integer
  end
end
