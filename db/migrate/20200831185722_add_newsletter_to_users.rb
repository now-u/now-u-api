# frozen_string_literal: true

class AddNewsletterToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :newsletter, :boolean, default: false
  end
end
