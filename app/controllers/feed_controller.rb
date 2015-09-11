class FeedController < ApplicationController
  before_action :authorize!

  def index
    @posts = Post.all(FeedPost.all(current_user))
  end
end
