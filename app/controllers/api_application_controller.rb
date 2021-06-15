# frozen_string_literal: true

class APIApplicationController < ActionController::API
  def current_user
    @current_user ||= find_user
  end

  def find_user
    byebug
    User.find_by("LOWER(email) = ?", facebook_user&.email)
  end

  def facebook_user
    @facebook_user ||= FacebookUser.load_from_session(session)
  end

  private

  def set_user
    token = request.headers['token']
    @user = User.find_by(token: token)

    render json: {}, status: :unauthorized unless @user&.verified
  end

  def user_response
    data = { data: @user.reload }
    data = data.to_json(
      methods: %i[selected_campaigns completed_campaigns completed_actions
                  rejected_actions favourited_actions completed_learning_resources
                  active_notifications organisation]
    )
  end

  def user_with_organisation
    data = { data: @user.reload }
    data = data.to_json(
      methods: [:organisation]
    )
  end
end
