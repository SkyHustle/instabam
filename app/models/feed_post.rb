class FeedPost #< OpenStruct
  def self.service
    @service ||= InstagramService.new
  end

  def self.all(user)
    service.feed_posts(user.token)["data"]
  end

  # attr_accessor :image

  # def initialize(data)
  #   @image  = data["images"]["standard_resolution"]["url"]
  # end

  # def self._build_object(data)
  #   OpenStruct.new(data)
  # end
end
