# frozen_string_literal: true

class Campaign < ApplicationRecord
  validates_presence_of :title

  has_one_attached :header_image_s3

  has_many :campaign_actions
  has_many :blog_articles
  has_many :articles
  has_many :offers
  has_many :partnerships
  has_many :learning_topics
  has_many :organisations, through: :partnerships
  has_many :campaign_goals
  has_many :goals, through: :campaign_goals
  has_many :user_campaigns

  has_many :learning_resources, through: :learning_topics

  include PgSearch::Model
  pg_search_scope :search, against: %i[title description_app description_web]

  has_many :cause_campaigns, dependent: :destroy
  has_many :causes, through: :cause_campaigns

  enum status: {
    draft: 0,
    published: 1,
    archived: 2,
  }

  scope :active, lambda {
    where('enabled IS TRUE AND start_date IS NULL AND end_date IS NULL').or(
      where('enabled IS TRUE AND (? > start_date AND ? < end_date)', DateTime.now, DateTime.now)
    )
  }

  scope :filter_by_cause, lambda { |cause_arr|
    joins(:causes).where(causes: { id: cause_arr })
  }

  scope :of_the_month, ->(bool) { where(of_the_month: bool) }

  scope :recommended, ->(bool) { where(recommended: bool) }

  scope :inactive, -> { where('end_date < ?', DateTime.now).all }
  scope :current_and_future, -> { where('enabled IS TRUE AND (end_date IS NULL OR end_date > ?)', DateTime.now) }

  def sdgs
    goals.where('type = ?', 'United Nations Sustainable Development Goal')
  end

  def key_aims
    goals.where('type = ?', 'Key Aim')
  end

  def header_image
    if header_image_s3.attached?
      header_image_s3.service_url
    else 
      super
    end
  end

  def general_partners
    organisations.where('partnerships.type = ?', 'general')
  end

  def campaign_partners
    organisations.where('partnerships.type = ?', 'campaign')
  end

  def number_of_campaigners
    user_campaigns.select(:user_id).distinct.count
  end

  def number_of_completed_actions
    UserAction.where(campaign_action_id: campaign_actions.ids, status: 'completed').count
  end
end
