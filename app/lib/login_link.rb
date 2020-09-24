class TokenNotPresentError < StandardError; end

class LoginLink
  def initialize(token:, platform: nil, version: nil)
    @token = token
    @platform = platform
    @version = version
  end

  def link
    raise TokenNotPresentError, 'Token is nil' unless @token
    return "com.nowu.app://loginMobile?token=#{@token}" if ios13?

    "https://nowu.page.link/?link=https://now-u.com/loginMobile?token%3D#{@token}&apn=com.nowu.app&isi=1516126639&ibi=com.nowu.app"
  end

  private

  def ios13?
    return false unless @platform && @version

    return true if (@platform.downcase == 'ios') && (@version.to_s.downcase =~ /^(13|14)/)

    false
  end
end
