class Action < ActiveYaml::Base
  include ActiveModel::Serializers::JSON
  include ActiveHash::Associations

  # extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :campaign

  set_root_path Rails.root.join('db', 'static')
end
