# frozen_string_literal: true

class Ability
  include CanCan::Ability
  UNRESTRICTED_MODEL_LIST = [
    Article,
    # BlogArticle,
    # BlogComment,
    Campaign,
    Cause,
    CampaignAction,
    # CampaignGoal,
    Faq,
    # Goal,
    LearningResource,
    LearningTopic,
    # Offer,
    # Organisation,
    # Partnership,
    Notification,
  ]

  MODEL_LIST = [
    # Admin,
    # User,
  ] + UNRESTRICTED_MODEL_LIST

  def initialize(admin)
    can :access, :rails_admin   # grant access to rails_admin for everyone
    can :read, :dashboard       # grant access to the dashboard for everyone
    can :read, UNRESTRICTED_MODEL_LIST

    if admin.has_permission(Admin.admin_roles[:campaign_researcher])
      can :manage, [
        Campaign,
        CampaignAction,
        LearningResource,
        LearningTopic,
        Partnership,
        Organisation,
        CampaignGoal
      ]
    end

    if admin.has_permission(Admin.admin_roles[:internal_notifications])
      can :manage, [
        Notification
      ]
      # Lets add an action to be able to release these notifications as well
    end

    if admin.has_permission(Admin.admin_roles[:news])
      can :manage, [
        Article
      ]
    end

    if admin.has_permission(Admin.admin_roles[:partners])
      can :manage, [
        Partnership,
        Organisation
      ]
    end

    if admin.has_permission(Admin.admin_roles[:superuser])
      can :manage, MODEL_LIST
    end
  end
end
