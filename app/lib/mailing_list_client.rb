class MailingListClient
  def initialize
    @client = init_client
  end

  def add_to_list(list_id:, email_address:, name: nil)
    names = name&.split(' ')
    additional_data = {}
    additional_data[:merge_fields] = { FNAME: names[0], LNAME: names[1..-1]&.join(' ').presence }.compact if names
    params = {
      body: { email_address: email_address, status: "subscribed" }.merge(additional_data)
    }
    @client.lists(list_id).members(membership_id(email_address)).upsert(params)
    Rails.logger.info "Subscriber added to list #{list_id}: #{params}"
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
