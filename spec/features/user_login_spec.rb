require 'rails_helper'

RSpec.feature "Users can login", type: :feature, js: true do
  before :each do
    @user_params = {
      first_name: 'Trapezius',
      last_name: 'Crushpecs',
      email: 'bloodwar@hemoclobber.clan',
      email_confirmation: 'bloodwar@hemoclobber.clan',
      password: 'twoswordsarebetterthanone',
      password_confirmation: 'twoswordsarebetterthanone'
    }

    User.create! @user_params
  end

  scenario "A user can log in and is taken to the home page" do
    # ACT
    visit root_path
    find(:link_or_button, 'Login').click

    expect(page).to have_text 'Password'

    fill_in 'email', with: @user_params[:email]
    fill_in 'password', with: @user_params[:password]
    find(:link_or_button, 'Submit').click

    expect(page).to have_text "Logged in as #{@user_params[:email]}"
    save_screenshot

  end
end
