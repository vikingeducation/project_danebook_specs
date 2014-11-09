require 'rails_helper'
require 'pry'
feature "User Accounts", :type => :feature do


  before do
    # go to the home page
    visit root_path
    @attrs = attributes_for(:user)

    fill_in 'user_fname', with: @attrs[:fname]
    fill_in 'user_lname', with: @attrs[:lname]
    fill_in 'user_email', with: @attrs[:email]
    fill_in "user_password", with: @attrs[:password]
    fill_in "user_password_confirmation", with: @attrs[:password]
    choose('user_gender_male')
  end

  scenario 'create a new user' do


    expect{ click_on('Sign Up!')}.to change(User, :count).by(1)

  end

  scenario 'redirect user after signup' do

    click_button('sign_up_btn')

    # verify that we've been redirected to that user's page
    expect(page).to have_content "#{@attrs[:fname]}"

    # verify the user is logged in after creation
    expect(page).to have_content "Log Out"

  end


end
