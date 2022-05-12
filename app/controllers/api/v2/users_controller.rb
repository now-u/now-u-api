# frozen_string_literal: true

class Api::V2::UsersController < APIApplicationController
  before_action :set_user, only: %i[show update destroy]

  def show
    render json: user_response, status: :ok
  end

private

  # Override from APIApplicationController in prep for v2
  def user_response
    data = { data: @user.reload }
    data = data.to_json(
      methods: %i[selected_campaigns selected_causes completed_campaigns completed_actions
                  rejected_actions favourited_actions completed_learning_resources
                  active_notifications organisation]
    )
  end
end
