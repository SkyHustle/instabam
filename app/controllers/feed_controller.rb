class FeedController < ApplicationController
  before_action :authorize!

  def index
    # binding.pry
    @feed_posts = FeedPost.all(current_user)["data"]
  end
end
