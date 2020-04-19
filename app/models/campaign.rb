class Campaign < ActiveYaml::Base
  include ActiveModel::Serializers::JSON
  include ActiveHash::Associations

  # extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :actions
  # has_many_active_hash :action

  set_root_path Rails.root.join('db', 'static')
end
