# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :token
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
