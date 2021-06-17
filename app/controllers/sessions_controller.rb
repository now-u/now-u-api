# frozen_string_literal: true

class SessionsController < APIApplicationController
  def facebook
    FacebookUser.begin_session!(session, request.env['omniauth.auth'])

    if current_user
      # by this point, the user has been authenticated via facebook and authorized via now-u
      render json: {}, status: :ok
    else
      FacebookUser.end_session!(session)
      render json: {}, status: 401
    end
  end
end
