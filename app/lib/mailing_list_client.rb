# frozen_string_literal: true

class MailingListClient
  def initialize
    @client = init_client
  end

  def subscriber(list_id:, email_address:)
    response = @client.lists(list_id).members(membership_id(email_address)).retrieve
    response.body
  rescue Gibbon::MailChimpError => e
    Rails.logger.error "Could not retrieve subscriber #{email_address} from list #{list_id}: #{e.message}"
    {}
  end

  def add_to_list(list_id:, email_address:, name: nil)
    additional_data = {}
    additional_data[:merge_fields] = { NAME: name } if name
    params = {
      body: { email_address: email_address, status: 'subscribed' }.merge(additional_data)
    }
    response = @client.lists(list_id).members(membership_id(email_address)).upsert(params)
    Rails.logger.info "Subscriber added to/updated on list #{list_id}: #{params}, #{response.body}"
  rescue Gibbon::MailChimpError => e
    Rails.logger.error "Could not add subscriber to list #{list_id}: #{e.message}"
  end

  def remove_from_list(list_id:, email_address:)
    response = @client.lists(list_id).members(membership_id(email_address)).update(body: { status: 'unsubscribed' })
    Rails.logger.info "Subscriber #{email_address} removed from list #{list_id}: #{response.body}"
  rescue Gibbon::MailChimpError => e
    Rails.logger.error "Could not remove subscriber #{email_address} from list #{list_id}: #{e.message}"
  end

  private

  def init_client
    raise StandardError, 'API key not set' unless ENV['MAILCHIMP_API_KEY']

    Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
  end

  def membership_id(email_address)
    Digest::MD5.hexdigest(email_address)
  end
end
