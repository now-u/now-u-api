# frozen_string_literal: true

class User < ApplicationRecord
  include ::V2::Image::ImageService

  has_one_attached :profile_picture_s3

  validates_uniqueness_of :email
  validates_uniqueness_of :auth_user_id

  has_many :blog_articles
  belongs_to :organisation, optional: true
  has_many :user_campaigns
  has_many :campaigns, through: :user_campaigns
  has_many :user_causes
  has_many :causes, through: :user_causes
  has_many :user_actions
  has_many :campaign_actions, through: :user_actions
  has_many :user_learning_resources
  has_many :learning_resources, through: :user_learning_resources
  has_many :user_notifications
  has_many :notifications, through: :user_notifications

  enum user_role_id: { user: 1, developer: 2, campaign_admin: 3 }

  # In V2, a campaign is completed by the user if:
  # 1. They have completed the learning resources (completed means just 'joined' in the sense that the relationship exists)
  # 2. They have completed the campaign actions (completed means just 'joined' in the sense that the relationship exists)
  def completed_campaigns_v2(boolean = true)
    learning_resource_topic_ids = learning_resources.pluck(:learning_topic_id)
    learning_resource_campaign_ids = LearningTopic.where(id: learning_resource_topic_ids).pluck(:campaign_id)
    campaign_action_ids = campaign_actions.pluck(:campaign_id)
    completed_campaign_ids = learning_resource_campaign_ids & campaign_action_ids
    if boolean
      Campaign.where(id: completed_campaign_ids)
    else
      Campaign.where.not(id: completed_campaign_ids)
    end
  end

  def campaign_actions(boolean = true)
    if boolean
      super()
    else
      CampaignAction.where.not(id: super().pluck(:id))
    end
  end

  def causes(boolean = true)
    if boolean
      super()
    else
      Cause.where.not(id: super().pluck(:id))
    end
  end

  def learning_resources(boolean = true)
    if boolean
      super()
    else
      LearningResource.where.not(id: super().pluck(:id))
    end
  end

  def selected_campaigns
    campaigns.ids
  end

  def joined_cause?(cause_id)
    causes.ids.include?(cause_id.to_i)
  end

  def completed_campaigns
    user_campaigns.where(progress: 100).pluck(:campaign_id)
  end

  def completed_actions_v2(boolean = true)
    completed_ids = user_actions.where(status: 'completed').pluck(:campaign_action_id)
    if boolean
      campaign_actions.where(id: completed_ids)
    else
      CampaignAction.where.not(id: completed_ids)
    end
  end

  def completed_actions
    user_actions.where(status: 'completed').pluck(:campaign_action_id)
  end

  def rejected_actions
    user_actions.where(status: 'rejected').pluck(:campaign_action_id)
  end

  def favourited_actions
    user_actions.where(status: 'favourited').pluck(:campaign_action_id)
  end

  def completed_learning_resources
    learning_resources.ids
  end

  def active_notifications
    notifications.where('user_notifications.dismissed IS false')
  end

  def reset!
    user_actions.destroy_all
    user_campaigns.destroy_all
    update_attributes(points: 0)
  end

  def profile_picture_url
    if profile_picture_s3.attached?
      get_image_path(profile_picture_s3)
    else
      super
    end
  end

  def self.get_user_from_request(request)
    token = request.headers['Authorization'].try(:split, ' ').try(:last)
    if not token
      return nil
    end
    begin
      decoded_token = (JWT.decode token, ENV['SUPABASE_JWT_SECRET'], true, { algorithm: 'HS256' })[0]
      # Get the user with the specified email address
      user = User.find_or_initialize_by(email: decoded_token["email"])
      # Set their auth id (So maybe one day we can remove email from this
      # service)
      user.auth_user_id = decoded_token["sub"]
      user.save
      user
    rescue => error
      puts(error)
      return nil
    end
  end
end
