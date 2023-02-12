class Admin < ApplicationRecord
  devise :saml_authenticatable, :trackable

  # README:
  # Follow the geometric sequence if you are to add more enums. Ie, after 128 will be 256, then 512, etc.
  # This is because we are doing bitmasking, to allow multiple roles to be assigned to each admin with a single enum. In a nutshell,
  # it is possible to store multiple numbers (bits) inside of each other, and extract them when we authorize. This way, we can assign
  # admins multiple roles using a single number, and extract their roles when we authorize them to do tasks. The method to extract
  # the roles is the has_permission method below.
  # If you want to read up more about bitmasking, read this: https://stackoverflow.com/questions/10493411/what-is-bit-masking

  enum admin_roles: {
    campaign_researcher: 1,
    # TODO This can be removed
    # blog_writer: 2,
    internal_notifications: 4,
    news: 8,
    analytics: 16,
    partners: 32,
    superuser: 64,
    survey: 128
  }

  def has_permission(role)
    true
    # TODO Set admin role based on SSO groups
    # admin_role & role == role
  end
end
