class ApplicationController < ActionController::API
  private

  def set_user
    token = request.headers['token']
    @user = User.find_by(token: token)
    # @user = User.first

    render json: {}, status: :unauthorized unless @user && @user.verified
  end

  def user_response
    data = { data: @user.reload }
    data = data.to_json(
      methods: [:selected_campaigns, :completed_campaigns, :completed_actions,
                :rejected_actions, :favourited_actions, :completed_learning_resources,
                :active_notifications, :organisation]
    )
  end
end
