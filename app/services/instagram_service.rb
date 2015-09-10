class InstagramService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.instagram.com/v1")
  end

  def feed_posts(token)
    parse(connection.get("users/self/feed?access_token=#{token}"))
  end

  def post(id)
    # JSON.parse(connection.get("schools/#{id}").body)
    # turns JSON object to ruby hash
    parse(connection.get("posts/#{id}"))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
