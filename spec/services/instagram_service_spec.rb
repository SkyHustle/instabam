require "rails_helper"

RSpec.describe User, type: :model do
  it "#feed" do
    VCR.use_cassette('instagram_service_test#feed') do
      service    = InstagramService.new
      feed_posts = service.feed_posts(ENV["ig_user_token"])
      post       = feed_posts.first

      expect(post.count).to eq(15)
      expect(post.keys.include?(:user)).to eq(true)
      expect(post.keys.include?(:comments)).to eq(true)
      expect(post.keys.include?(:tags)).to eq(true)
    end
  end
end
