class CreateJoinTableCausesActions < ActiveRecord::Migration[5.2]
  def change
    create_join_table :causes, :actions do |t|
      t.index [:cause_id, :action_id]
      # t.index [:action_id, :cause_id]
    end
  end
end
