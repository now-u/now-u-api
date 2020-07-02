class SmsClient
  def initialize(phone_number:, text:)
    @phone_number = phone_number
    @text = text
    @client = init_client
  end

  def send
    response = @client.publish(phone_number: @phone_number, message: @text)
    Rails.logger.info "User registration/login SMS sent; phone: #{@phone_number}, Text: #{@text}; Response: #{response}"
  end

  private

  def init_client
    x = Aws::SNS::Client.new(client_config)
    resp = x.set_sms_attributes(attributes: { "DefaultSenderID" => "NowU" })
    x
  end

  def client_config
    { region: "eu-west-1" }
  end
end
