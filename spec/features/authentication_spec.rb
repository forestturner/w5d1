
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'password', :with => "biscuits"
      click_on "Create User"
    end

    scenario "shows errors when username is blank" do
      expect(page).to have_content "Username can't be blank"
    end
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'username', :with => "testing_username"
      fill_in 'password', :with => "biscuits"
      click_on "Create User"
    end
    scenario "shows username after signup" do
      expect(page).to have_content "testing_username"
    end


    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "testing_username"
    end
  end

  feature "signing in a user" do
    User.create!(username: "testing_username", password: "biscuits")

    before(:each) do
      visit new_session_url
      fill_in 'username', :with => "testing_username"
      fill_in 'password', :with => "biscuits"
      click_on "Sign In"
    end
    scenario "shows username after signing in" do
      expect(page).to have_content "testing_username"
    end

  end

  feature "Signing out" do
    before(:each) do
      visit new_user_url
      fill_in 'username', :with => "testing_username"
      fill_in 'password', :with => "biscuits"
      click_on "Create User"
    end

    scenario "logging out" do
      expect(page).to have_content "Log Out"
    end

    scenario "after clicking logout is redirected to the login page" do
      click_on "Log out"
      expect(page).to have_content "Log in"
      expect(page).to have_content "Username"
      expect(page).to have_content "Password"
    end
  end

end
