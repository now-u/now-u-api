class AddMoreFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :location, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :monthly_donation_limit, :float
    add_column :users, :home_owner, :bool
  end
end
