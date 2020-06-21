class UserAction < ApplicationRecord
  belongs_to :user
  belongs_to :action
  after_destroy :decrement_score
  after_update :update_score

  def increment_score
    user.increment!(:points, 5)
  end

  def decrement_score
    decrement = [5, user.points].min
    user.decrement!(:points, decrement)
  end

  def update_score
    if saved_change_to_attribute?(:status)
      increment_score if status == 'completed'
      decrement_score if status == 'rejected'
    end
  end
end
