class MigrationAddUserAuthId < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :auth_user_id, :string, deafult: "-", null: false
    add_index :users, :auth_user_id
  end
end
