# frozen_string_literal: true

require 'sendgrid-ruby'
include SendGrid

class EmailClient
  def initialize(email:, body:)
    @email = email
    @body = body
  end

  def send
    data = {
      'personalizations' => [
        {
          'to' => [
            {
              'email' => @email
            }
          ],
          'subject' => 'Now-u Account Login'
        }
      ],
      'from' => {
        'email' => 'support@now-u.com',
        'name' => 'Now-U Support'
      },
      'content' => [
        {
          'type' => 'text/html',
          'value' => @body
        }
      ]
    }
    sg = SendGrid::API.new(api_key: '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')
    response = sg.client.mail._('send').post(request_body: data)
    Rails.logger.info "User registration/login email sent; Email: #{@email}, Body: #{@body}; Response code: #{response.status_code}, body: #{response.body}, header: #{response.headers}"
  end
end
