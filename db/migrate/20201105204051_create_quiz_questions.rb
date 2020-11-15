class CreateQuizQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_questions do |t|
      t.string :question
      t.integer :quiz_id

      t.timestamps
    end
    add_foreign_key :quiz_questions, :quizzes
  end
end
