# frozen_string_literal: true

class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :title, :description_app, :header_image, :created_at, :updated_at,
             :video_link, :description_web, :enabled, :start_date, :end_date,
             :short_name, :number_of_campaigners, :number_of_completed_actions, :general_partners,
             :campaign_partners, :sdgs, :key_aims, :campaign_actions, :learning_topics, :infographic_url

  def campaign_actions
    object.campaign_actions.active
  end

  def learning_topics
    object.learning_topics.order('priority ASC')
  end
end
