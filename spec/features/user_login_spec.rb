require "rails_helper"

RSpec.feature "User", type: :feature do
  scenario "can successfully login" do
    VCR.use_cassette('user_login_test#login') do
      visit root_path

      login_user

      click_link("Login")

      expect(page).to_not have_link("Login")

      expect(page).to have_link("Logout")
      expect(page).to have_content("binky")
    end
  end

  scenario "cannot visit feed page without logging in" do
    visit root_path

    visit feed_path

    expect(current_path).to_not eq(feed_path)
    expect(current_path).to eq(root_path)
  end

  xscenario "cannot login with invalid credentials" do
    visit root_path

    click_link("Login")

    expect(current_path).to eq(root_path)
  end
end
