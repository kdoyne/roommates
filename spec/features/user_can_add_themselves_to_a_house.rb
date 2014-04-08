require 'spec_helper'

describe "a user can add themselves to a house", :js => true  do
    let!(:house) { FactoryGirl.create(:house) } 
    let!(:user_1) { FactoryGirl.create(:user, house_id: house.id) }

  it "lets a user add themselves to a house" do

    visit root_path
    click_link "Register"
    fill_in :user_email, with: "test@test.com"
    fill_in :user_first_name, with: "Test"
    fill_in :user_last_name, with: "Test"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    fill_in :user_phone_number, with: "1231231234"
    click_button "Join!"

    find('#join_house').click
    fill_in :find_house, with: house.name
    click_button "Submit"
    expect(page).to have_content house.street_address
    fill_in :passcode, with: house.passcode 
    click_button "Confirm"
    save_and_open_page

    expect(page).to have_content user_1.first_name
    expect(page).to have_content "Test"

  end

end