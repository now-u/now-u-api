class CreateCauseLearningResources < ActiveRecord::Migration[5.2]
  def change
    create_table :cause_learning_resources do |t|
      t.references :cause, index: true, null: false, foreign_key: { to_table: :causes }
      t.references :learning_resource, index: true, null: false, foreign_key: { to_table: :learning_resources }

      t.timestamps
    end
  end
end
