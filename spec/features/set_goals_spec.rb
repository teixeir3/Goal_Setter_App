require 'spec_helper'

feature "Creating new goals" do
  before do
    sign_up('test user')
  end

  it "allows user to create goals" do
    create_goal('New Goal')

    expect(page).to have_content('New Goal')
  end
end

feature "Viewing goals" do
  before do
    sign_up('test user')
  end

  it "allows other users to view public goals" do
    create_goal('Public Goal')
    click_button 'Sign Out'

    sign_up('another test user')
    visit '/users'
    click_link 'test user'

    expect(page).to have_content('Public Goal')
  end

  it "doesn't allow other users to view private goals" do
    create_goal('Private Goal', true)
    click_button 'Sign Out'

    sign_up('another test user')
    visit '/users'
    click_link 'test user'

    expect(page).to_not have_content('Private Goal')
  end

  it "allows author to view their own private goals" do
    create_goal('Private Goal', true)

    expect(page).to_not have_content('Private Goal')
  end
end

feature "Editing goals" do
  it "doesn't allow another user to change unowned goals" do
    create_goal('My Goal')
    click_button 'Sign Out'

    sign_up('another test user')
    visit '/users'
    click_link 'test user'

    expect(page).to_not have_content('Edit Goal')
    expect(page).to_not have_content('Completed')
  end

  it "allows author to edit their goals" do
    create_goal('My Goal')

    expect(page).to have_content('Edit Goal')
    expect(page).to have_content('Completed')
  end

  feature "Tracking" do
    it "doens't allow a user to complete already completed goals" do
      create_goal('My Goal')

      click_button 'Completed'

      expect(page).to_not have_content('Completed')
    end
  end
end

