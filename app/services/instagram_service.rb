class InstagramService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.instagram.com/v1")
  end

  def feed_posts(token)
    # JSON.parse(connection.get("schools").body)
    # send get request to http://localhost:3000/v1/schools
    parse(connection.get("users/self/feed?access_token=#{token}"))
    # https://api.instagram.com/v1/users/self/feed?access_token=ACCESS-TOKEN
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
