require 'spec_helper'

describe "a user can join the website" do
  
  it "creates a user and logs in, then logs out" do

    visit root_path
    click_link "Register"
    fill_in :user_email, with: "test@test.com"
    fill_in :user_first_name, with: "Test"
    fill_in :user_last_name, with: "Test"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    fill_in :user_phone_number, with: "1231231234"
    click_button "Join!"

    expect(page).to have_content "Log Out Test"

    click_link "Log Out Test"
    expect(page).to have_content "Log In"

  end
end