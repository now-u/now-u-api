class CreateAppVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :app_versions do |t|
      t.string :version_number
      t.boolean :compatible_with_current_api
      t.text :release_notes

      t.timestamps
    end
  end
end
