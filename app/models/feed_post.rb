class FeedPost < OpenStruct
  def self.service
    @service ||= InstagramService.new
  end

  def self.all(user)
    service.feed_posts(user.token)
  end

  def self._build_object(data)
    OpenStruct.new(data)
  end
end
