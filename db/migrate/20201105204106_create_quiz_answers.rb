# frozen_string_literal: true

class CreateQuizAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_answers do |t|
      t.string :answer_image_url
      t.string :answer_text
      t.boolean :is_correct, default: false
      t.integer :quiz_question_id

      t.timestamps
    end
    add_foreign_key :quiz_answers, :quiz_questions
  end
end
