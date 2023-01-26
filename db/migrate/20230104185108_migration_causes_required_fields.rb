class MigrationCausesRequiredFields < ActiveRecord::Migration[5.2]
  def change
    change_column_null :causes, :image, false, ""
    change_column_null :causes, :icon, false, ""
    change_column_null :causes, :name, false, ""
    change_column_null :causes, :description, false, ""
  end
end
