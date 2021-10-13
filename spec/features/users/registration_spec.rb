require 'rails_helper'
# When a user visits the '/registration' path they should see a form to register.
# The form should include:
#
#  Email
#  Password
#  Password Confirmation
#  Register Button
# Once the user registers they should be logged in and redirected to the dashboard page
RSpec.describe 'user registration page' do
  before :each do
    visit registration_path
  end

  it 'can display registration form' do
    save_and_open_page
    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_content("Password Confirmation:")
    expect(page).to have_content("Register")
  end
end
