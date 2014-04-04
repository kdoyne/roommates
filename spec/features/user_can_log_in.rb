require 'spec_helper'

describe "a user can log in" do
  let!(:user) { FactoryGirl.create(:user) }

  it "can log in and show the user page" do
    visit root_path
    click_link "Log In"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In!"

    expect(page).to have_content user.first_name

    click_link "Log Out #{user.first_name}"
    
    expect(page).to have_content "Welcome"

  end
end
