class CreateActionStepOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :action_step_options do |t|
      t.integer :action_step_id
      t.integer :index, default: 0
      t.string :text

      t.timestamps
    end
  end
end
