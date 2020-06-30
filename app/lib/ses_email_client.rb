class SesEmailClient < EmailClient
  def send
    awsregion = "eu-west-2"
    ses = Aws::SES::Client.new(region: awsregion)
    response = ses.send_email(email_config)
    Rails.logger.info "User registration/login email sent; Email: #{@email}, Body: #{@body}; Response: #{response}"
  end

  private

  def email_config
    encoding = "UTF-8"
    sender = "support@now-u.com"
    subject = "Now-u Account Login"
    {
      destination: {
        to_addresses: [
          @email,
        ],
      },
      message: {
        body: {
          html: {
            charset: encoding,
            data: @body,
          },
          text: {
            charset: encoding,
            data: 'N/A',
          },
        },
        subject: {
          charset: encoding,
          data: subject,
        },
      },
    source: sender
    }
  end
end
