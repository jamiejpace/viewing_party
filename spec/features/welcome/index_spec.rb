require 'rails_helper'

RSpec.describe 'welcome page' do
  before :each do
    visit root_path
  end

  it 'can display welcome information' do
    # When a user visits the root path they should be on the welcome page which includes:
    #   Welcome message x
    #   Brief description of the application x
    #   Button to Log in x
    #   Link to Registration x
    expected = "Viewing Party is an application in which users can explore movie options and create a viewing party event for the user and friends."

    expect(page).to have_content("Welcome to Viewing Party!")
    expect(page).to have_content(expected)
    expect(page).to have_button("Log In")
    expect(page).to have_link("Register for an Account")
  end

  #happy path
  it 'can redirect to user log in page' do
    # Details: Implement basic auth in the application allowing a user to log in with an email and password.
    # The password should be stored in the database using bcrypt.
    user = User.create(email: "user@email.com", password: "password")

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_button "Log In"
    
    expect(current_path).to eq(user_dashboard_path(user.id))
  end
end
