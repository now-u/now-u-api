class ShortUrlClient
  TOKEN = '43027f15c5cef9f67f624b6c849a076ba86c6aba'.freeze

  def initialize(url:)
    @url = url
    @client = init_client
  end

  def shorten
    response = @client.shorten(long_url: @url)
    response.link
  end

  private

  def init_client
    Bitly::API::Client.new(token: TOKEN)
  end
end
