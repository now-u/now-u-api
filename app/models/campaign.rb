class Campaign < ActiveYaml::Base
  include ActiveModel::Serializers::JSON

  set_root_path Rails.root.join('db', 'static')
end
