# frozen_string_literal: true

class AddCommentToUserActions < ActiveRecord::Migration[5.2]
  def change
    add_column :user_actions, :comment, :string
  end
end
