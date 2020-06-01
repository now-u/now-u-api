class ApplicationController < ActionController::API
  private

  def set_user
    token = request.headers['token']
    @user = User.find_by(token: token)

    render json: {}, status: :unauthorized unless @user && @user.verified
  end
end
