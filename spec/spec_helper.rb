require "simplecov"

SimpleCov.start 'rails' do
    require 'simplecov-badge'
    # add your normal SimpleCov configs
    add_filter "/app/admin/"
    # configure any options you want for SimpleCov::Formatter::BadgeFormatter
    SimpleCov::Formatter::BadgeFormatter.generate_groups = true
    SimpleCov::Formatter::BadgeFormatter.strength_foreground = true
    SimpleCov::Formatter::BadgeFormatter.timestamp = true
    # call SimpleCov::Formatter::BadgeFormatter after the normal HTMLFormatter
    SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
        SimpleCov::Formatter::HTMLFormatter,
        SimpleCov::Formatter::BadgeFormatter,
    ]
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
                          token: "abcdefghij",
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
