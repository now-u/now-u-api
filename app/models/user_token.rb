class UserToken < ApplicationRecord
  validates_uniqueness_of :token
  before_create :generate_token
  before_create :set_expiry

  belongs_to :user

  scope :valid, -> { where('expires_at > ?', Time.current) }

  def generate_token
    self.token = (0..9).to_a.sample(6).join
  end

  def set_expiry
    self.expires_at = (Time.current + 30.minutes)
  end

  def expired?
    self.expires_at < Time.current
  end

  def expire!
    new_expiry = Time.current - 1.minute
    self.expires_at = new_expiry
    self.save!
  end
end
