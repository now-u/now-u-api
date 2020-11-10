class ActionSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :type, :campaign_id, :created_at, :updated_at,
             :what_description, :why_description, :time, :enabled, :release_date,
             :action_steps

  def action_steps
    data = self.object.action_steps.order('action_index ASC, id ASC')
    ActiveModel::Serializer::CollectionSerializer.new(data, serializer: ActionStepSerializer).as_json
  end
end
