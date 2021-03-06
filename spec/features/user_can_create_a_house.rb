require 'spec_helper'

describe "a user can create a house" do
  let!(:user) { FactoryGirl.create(:user) }

  it "lets a user make a house" do
  
    login(user)
    save_and_open_page
    click_link "Create a house"
    fill_in :house_street_address, with: "123 main street"
    fill_in :house_city, with: "New York"
    fill_in :house_state, with: "NY"
    fill_in :house_name, with: "My House"
    fill_in :house_passcode, with: "passcode"
    click_button "Create House"
    expect(page).to have_content "123 main street"

  end

  def login(user)
    visit root_path
    click_link "Log In"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In!"
  end

end
