require 'spec_helper'

describe "a user can add calendar events", :js => true  do
  let!(:user) { FactoryGirl.create(:user) }

  it "lets a user add and view an event" do

    login(user)
    click_button "Add A New Bill"
    fill_in :name, with: "Cable"
    fill_in :amount, with: "30.00"
    fill_in :due_date, with: "04/29/2014"
    click_button "Save"

    expect(page).to have_content "Cable"

  end


  def login(user)
    visit root_path
    click_link "Log In"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In!"
  end

end