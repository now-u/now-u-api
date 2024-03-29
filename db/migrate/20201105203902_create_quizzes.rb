# frozen_string_literal: true

class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
