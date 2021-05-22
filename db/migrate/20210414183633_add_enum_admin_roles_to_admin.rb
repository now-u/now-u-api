class AddEnumAdminRolesToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :admin_role, :integer
  end
end
