class CreateJoinTableCausesLearningResources < ActiveRecord::Migration[5.2]
  def change
    create_join_table :causes, :learning_resources do |t|
      # t.index [:cause_id, :learning_resource_id]
      # t.index [:learning_resource_id, :cause_id]
    end
  end
end
