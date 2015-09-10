require "rails_helper"

RSpec.describe User, type: :model do
  attr_reader :service

  def setup
    @service = InstagramService.new
  end

  context "#feed" do
    VCR.use_cassette('instagram_service_test#feed') do
    end
  end
end
