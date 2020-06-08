class ApplicationController < ActionController::API
  private

  def set_user
    token = request.headers['token']
    @user = User.find_by(token: token)
    # @user = User.first

    render json: {}, status: :unauthorized unless @user && @user.verified
  end

  def user_response
    data = { data: @user }
    data = data.to_json(
      methods: [:selected_campaigns, :completed_campaigns, :completed_actions, :rejected_actions]
    )
  end
end
