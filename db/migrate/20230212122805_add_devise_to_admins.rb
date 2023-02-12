# frozen_string_literal: true

class AddDeviseToAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.string :groups, array: true, default: []

      t.timestamps null: false

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
    end

    add_index :admins, :email, unique: true
  end
end
