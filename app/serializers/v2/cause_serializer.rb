# frozen_string_literal: true

include ::V2::Progress::UserProgress

class V2::CauseSerializer < ActiveModel::Serializer
  attributes :id, :image, :icon, :name, :description, :joiners, :created_at, :updated_at, :joined

  def joined
    get_status(object.id, @instance_options[:request], @instance_options[:user])
  end
end
