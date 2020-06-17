class UserCampaign < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  after_create :increment_score
  after_destroy :decrement_score

  def increment_score
    user.increment!(:points, 10)
  end

  def decrement_score
    decrement = [10, user.points].min
    user.decrement!(:points, decrement)
  end
end
