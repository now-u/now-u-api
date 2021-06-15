class FacebookUser
  attr_reader :email

  def initialize(email:, provider: 'facebook')
    @email = email&.downcase
    @provider = provider&.to_s
  end

  def self.begin_session!(session, omniauth_payload)
    byebug
    session['facebook_user'] = {
      'email' => omniauth_payload.info.email,
      'name' => omniauth_payload.info.name,
      'uuid' => omniauth_payload.uid,
      'last_active_at' => Time.zone.now,
      'id_token' => omniauth_payload.credentials.token,
      'provider' => omniauth_payload.provider,
    }
  end

  def self.load_from_session(session)
    facebook_sign_in_session = session['facebook_user']
    return unless facebook_sign_in_session

    facebook_sign_in_session['last_active_at'] = Time.zone.now

    new(
      email: facebook_sign_in_session['email'],
      id_token: facebook_sign_in_session['id_token'],
      provider: facebook_sign_in_session['provider'],
    )
  end

private

  def signed_in_from_facebook?
    @provider == 'facebook'
  end
end
