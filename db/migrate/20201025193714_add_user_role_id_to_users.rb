# frozen_string_literal: true

class AddUserRoleIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_role_id, :integer, null: true
  end
end
