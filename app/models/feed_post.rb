class FeedPost < OpenStruct
  def self.service
    @service ||= InstagramService.new
  end

  def self.all(user)
    service.feed_posts(user.token).map { |feed_post| FeedPost.new(feed_post) }
  end
end
