require "rails_helper"

RSpec.describe User, type: :model do
  context "a valid user" do
    before do
      login_user
    end

    it "has a provider" do
      expect(user.provider).to eq "instagram"
    end

    it "has a uid" do
      expect(user.uid).to eq "987654"
    end

    it "has a nickname" do
      expect(user.nickname).to eq "binky"
      expect(user.nickname).to_not eq "slinky"
    end

    it "has an image" do
      expect(user.image_url).to eq "https://pbs.twimg.com/profile_images/589490282888060929/zkxLsGbY.jpg"
    end

    it "has a token" do
      expect(user.token)
    end
  end
end
