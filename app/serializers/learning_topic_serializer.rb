# frozen_string_literal: true

class LearningTopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_link, :our_answer, :campaign_id, :created_at,
             :updated_at, :priority, :learning_resources

  def learning_resources
    object.learning_resources.active
  end
end
