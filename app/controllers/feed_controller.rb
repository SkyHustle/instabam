class FeedController < ApplicationController
  before_action :authorize!

  def index
    @feed_posts = FeedPost.all(current_user)
  end
end
