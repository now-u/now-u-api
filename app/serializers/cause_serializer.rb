# frozen_string_literal: true

class CauseSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :icon, :joiners, :description
end
