require 'spec_helper'

feature "Admins" do
  before do
    create_admin
    click_button 'Sign Out'
    sign_up('test user')
  end

  it "can delete users" do
    click_button 'Sign Out'
    sign_in('admin')
    visit '/users'

    expect(page).to have_button('Delete User')
  end

  it "prevents normal users from delete users" do
    visit '/users'
    expect(page).to_not have_button('Delete User')
  end

  it "can delete public goals" do
    create_goal('public goal')
    click_button 'Sign Out'
    sign_in('admin')
    visit '/users'
    click_link 'test user'

    expect(page).to have_button('Delete Goal')
  end

  it "can delete private goals" do
    create_goal('private goal')
    click_button 'Sign Out'
    sign_in('admin')
    visit '/users'
    click_link 'test user'

    expect(page).to have_button('Delete Goal')
  end


end