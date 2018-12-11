require 'rails_helper'

RSpec.feature "User logs in", type: :feature, js: true do

  before :each do
    @user = User.create!(
      first_name: "Robert",
      last_name: "Paulsen",
      email: 'bob@projectmayhem.com',
      password: '12345678',
      password_confirmation: '12345678'
    )
    end

  scenario "They should be taken to the home page" do

    visit "/login"

    puts page.html

    within "form" do
      fill_in id: "session_email", with: @user.email
      fill_in id: "session_password", with: @user.password

      click_button "Log In"
    end

    sleep 2

    save_screenshot "logged-in.png"

    expect(page).to have_content "Welcome"

  end
end
