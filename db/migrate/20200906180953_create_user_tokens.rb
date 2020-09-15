class CreateUserTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tokens do |t|
      t.string :token, null: false, index: { unique: true }
      t.integer :user_id
      t.datetime :expires_at

      t.timestamps
    end
  end
end
