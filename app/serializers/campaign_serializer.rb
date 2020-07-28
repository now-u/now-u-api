class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :title, :description_app, :header_image, :created_at, :updated_at,
             :video_link, :description_web, :enabled, :start_date, :end_date,
             :short_name, :number_of_campaigners, :general_partners, :campaign_partners,
             :sdgs, :key_aims,
             :actions, :learning_topics, :infographic_url

  def actions
    self.object.actions.active
  end

  def learning_topics
    self.object.learning_topics.order('priority ASC')
  end
end
