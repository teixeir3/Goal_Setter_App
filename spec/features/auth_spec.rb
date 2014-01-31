require 'spec_helper'

feature "the signup process" do

  it "has a new user page" do
    visit '/users/new'
  end

  feature "signing up a user" do
    before do
      visit 'users/new'
    end

    it "shows username on the homepage after signup" do
      fill_in 'Username', :with => 'test user'
      fill_in 'Password', :with => 'password'
      click_button 'Sign Up'

      expect(page).to have_content('test user')
    end
  end

  feature "logging in" do
    before do
      visit 'session/new'
    end

    it "shows username on the homepage after login" do
      fill_in 'Username', :with => 'test user'
      fill_in 'Password', :with => 'password'
      click_button 'Sign In'

      expect(page).to have_content('test user')
    end
  end

  feature "logging out" do

    it "begins with logged out state" do
      visit '/'
      expect(page).to have_content('Sign In')
    end

    it "doesn't show username on the homepage after logout" do
      fill_in 'Username', :with => 'test user'
      fill_in 'Password', :with => 'password'
      click_button 'Sign In'
      click_button 'Sign Out'

      expect(page).to_not have_content('test user')
    end
  end
end
