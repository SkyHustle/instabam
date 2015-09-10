require "simplecov"
SimpleCov.start

require 'webmock'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def user
    @user ||= User.create(nickname: "binky",
                          provider: "instagram",
                          token: Figaro.env.ig_user_token,
                          uid: "987654",
                          image_url: "https://pbs.twimg.com/profile_images/589490282888060929/zkxLsGbY.jpg")
  end

  def login_user
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
      "provider"    => user.provider,
      "uid"         => user.uid,
      "info"        => {nickname: user.nickname, image_url: user.image_url},
      "credentials" => {token: user.token}
    })
  end
end
