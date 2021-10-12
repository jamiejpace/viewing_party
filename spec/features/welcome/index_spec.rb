require 'rails_helper'

RSpec.describe 'welcome page' do
  it 'can display welcome information' do
    # When a user visits the root path they should be on the welcome page which includes:
    #   Welcome message x
    #   Brief description of the application x
    #   Button to Log in x
    #   Link to Registration x
    # Details: Implement basic auth in the application allowing a user to log in with an email and password.
    # The password should be stored in the database using bcrypt.

    visit root_path

    expected = "Viewing Party is an application in which users can explore movie options and create a viewing party event for the user and friends."

    expect(page).to have_content("Welcome to Viewing Party!")
    expect(page).to have_content(expected)
    expect(page).to have_button("Log In")
    expect(page).to have_link("Register for an Account")
  end
end
