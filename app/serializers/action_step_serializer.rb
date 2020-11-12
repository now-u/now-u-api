class ActionStepSerializer < ActiveModel::Serializer
  attributes :id, :action_id, :index, :text, :options

  def options
    data = self.object.action_step_options.order('index ASC, id ASC')
    ActiveModel::Serializer::CollectionSerializer.new(data, serializer: ActionStepOptionSerializer).as_json
  end
end
