
class EmailClient
  def initialize(email:, body:)
    @email = email
    @body = body
  end

  def send
    'ok'
  end
end
