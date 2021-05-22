# frozen_string_literal: true

class CreateCauseActions < ActiveRecord::Migration[5.2]
  def change
    create_table :cause_actions do |t|
      t.references :cause, index: true, null: false, foreign_key: { to_table: :causes }
      t.references :action, index: true, null: false, foreign_key: { to_table: :actions }

      t.timestamps
    end
  end
end
