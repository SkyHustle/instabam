class InstagramService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.instagram.com/v1")
    # connection.query[:apikey] = ENV["ig_user_token"]
  end

  def feed_posts(token)
    parse(connection.get("users/self/feed?access_token=#{token}"))[:data]
  end

  def post(id)
    # JSON.parse(connection.get("schools/#{id}").body)
    # turns JSON object to ruby hash
    parse(connection.get("posts/#{id}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
