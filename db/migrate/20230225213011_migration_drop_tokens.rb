class MigrationDropTokens < ActiveRecord::Migration[5.2]
  def change
     drop_table :user_tokens
     remove_column :users, :token
     remove_column :users, :verified
  end
end
