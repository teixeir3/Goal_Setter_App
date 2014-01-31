require 'spec_helper'

feature "the signup process" do

  it "has a new user page" do
    visit '/users/new'
  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
      sign_up('test user')

      expect(page).to have_content('test user')
    end
  end
end

feature "logging in" do

  it "shows username on the homepage after login" do
    sign_up('test user')
    click_button 'Sign Out'

    sign_in('test user')

    expect(page).to have_content('test user')
  end
end

feature "logging out" do
  before do
    visit '/'
  end

  it "begins with logged out state" do
    expect(page).to have_content('Sign In')
  end

  it "doesn't show username on the homepage after logout" do
    sign_up('test user')
    click_button 'Sign Out'

    expect(page).to_not have_content('test user')
  end
end
