class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # set default role to 1

  enum admin_roles: {
    campaign_researcher: 1,
    blog_writer: 2,
    internal_notifications: 4,
    news: 8,
    analytics: 16,
    partners: 32,
    superuser: 64,
    survey: 128
  }

  def has_permission(role)
    admin_role & role == role
  end
end
