require 'rails_helper'

RSpec.describe 'user registration page' do
  before :each do
    visit registration_path
    user1 = User.create!(email: "odell@gmail.com", password_digest: "1b3kdf9874dgtfs")
  end

  it 'can display registration form' do
    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_content("Password Confirmation:")
    expect(page).to have_content("Register")
    expect(page).to have_link("Already Registered? Login Here")
  end

  it 'can register user given valid credentials' do
    fill_in :email, with: "mose@gmail.com"
    fill_in :password, with: "snacksplease"
    fill_in :password_confirmation, with: "snacksplease"

    click_on "Register"

    user2 = User.last

    expect(current_path).to eq(user_dashboard_path(user2.id))
    expect(page).to have_content("Successfully created account!")
  end

  it 'can redirect back to registration page with error if password does not match' do
    fill_in :email, with: "mose@gmail.com"
    fill_in :password, with: "snacksplease"
    fill_in :password_confirmation, with: "barkbark"

    click_on "Register"

    expect(current_path).to eq(registration_path)
    expect(page).to have_content("Passwords do not match, please try again.")
  end

  it 'can redirect back to registration page with error if invalid credentials' do
    fill_in :email, with: "odell@gmail.com"
    fill_in :password, with: "barkbark"
    fill_in :password_confirmation, with: "barkbark"

    click_on "Register"

    expect(current_path).to eq(registration_path)
    expect(page).to have_content("Unable to register, please try again.")
  end

  it 'can redirect back to registration page with error if email not correct format' do
    fill_in :email, with: "odell"
    fill_in :password, with: "barkbark"
    fill_in :password_confirmation, with: "barkbark"

    click_on "Register"

    expect(current_path).to eq(registration_path)
    expect(page).to have_content("Unable to register, please try again.")
  end
end
