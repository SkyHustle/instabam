class InstagramService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.instagram.com/v1")
  end

  def feed_posts(token)
    parse(connection.get("users/self/feed?access_token=#{token}"))[:data]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
