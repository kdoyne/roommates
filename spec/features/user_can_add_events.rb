require 'spec_helper'

describe "a user can add calendar events", :js => true  do
  let!(:user) { FactoryGirl.create(:user) }

  it "lets a user add and view an event" do

    login(user)
    click_button "Add A New Event"
    fill_in :event, with: "party"
    fill_in :date, with: "04/29/2014"
    fill_in :time, with: "10:30 PM"
    click_button "Save"

    expect(page).to have_content "party"

  end


  def login(user)
    visit root_path
    click_link "Log In"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In!"
  end

end