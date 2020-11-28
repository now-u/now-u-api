# frozen_string_literal: true

class CreateLearningTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :learning_topics do |t|
      t.string :title
      t.string :image_link
      t.string :our_answer
      t.integer :campaign_id

      t.timestamps
    end
  end
end
