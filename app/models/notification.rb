# frozen_string_literal: true

class Notification < ApplicationRecord

  def send_notification_to_all_users
    User.all.each do | user |
      user.notifications << self
    end
  end
end
