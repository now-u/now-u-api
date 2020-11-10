class CreateActionSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :action_steps do |t|
      t.integer :action_id
      t.integer :action_index, default: 0
      t.string :text

      t.timestamps
    end
  end
end
