# frozen_string_literal: true

class Api::V1::SessionsController < APIApplicationController
  def facebook
    byebug
    FacebookUser.begin_session!(session, request.env['omniauth.auth'])

    if current_user
      FacebookUsers::Update.call(user: current_user, facebook_sign_in_user: facebook_sign_in_user)

      redirect_to session.delete(:requested_path) || root_path
    else
      session.delete(:requested_path)
      FacebookUser.end_session!(session)
      redirect_to sign_in_user_not_found_path
    end
  end
end
