require "rails_helper"

RSpec.describe User, type: :model do
  it "#feed" do
    VCR.use_cassette('instagram_service_test#feed') do
      service = InstagramService.new.feed_posts(ENV["ig_user_token"])
    end
  end
end
