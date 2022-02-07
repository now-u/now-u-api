class CreateUserCauseJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_causes do |t|
      t.references :cause, index: true, null: false, foreign_key: { to_table: :causes }
      t.references :user, index: true, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
