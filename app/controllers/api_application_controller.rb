# frozen_string_literal: true

class APIApplicationController < ActionController::API
  def current_user
    # looks for user in memory or runs find_or_create
    @current_user ||= find_or_create_user
  end

  def find_or_create_user
    # one thing that needs to be discussed is that NOT all facebook users have email
    # should we rather be searching by their facebook UUID, which we know everyone has. 
    # and if their email field is blank, we can manually ask them to input an email into now-u
    User.find_or_create_by(email: facebook_user&.email)
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
    data.to_json(
      methods: %i[selected_campaigns completed_campaigns completed_actions
                  rejected_actions favourited_actions completed_learning_resources
                  active_notifications organisation]
    )
  end

  def user_with_organisation
    data = { data: @user.reload }
    data.to_json(
      methods: [:organisation]
    )
  end
end
