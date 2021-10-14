require 'rails_helper'

RSpec.describe 'user dashboard page' do
  before :each do
    visit registration_path
    fill_in :email, with: "mose@gmail.com"
    fill_in :password, with: "snacksplease"
    fill_in :password_confirmation, with: "snacksplease"

    click_on "Register"

    @user = User.last
  end

 it 'displays dashboard sections' do
   expect(page).to have_content("Welcome #{@user.email}!")
   expect(page).to have_button("Discover Movies")

   within "#friends" do
     expect(page).to have_content("Friends")
     expect(page).to have_content("You currently have no friends 😭")
     expect(page).to have_field(:email, with: "Friend's Email")
     expect(page).to have_button("Add Friend")
   end

   within "#parties" do
     expect(page).to have_content("Viewing Parties")
   end
 end

 it 'redirects to discover page with button' do
   click_on "Discover Movies"

   expect(current_path).to eq(discover_path)
 end

 it 'can add a friend to page and display added friend email' do
  User.create!(email: "bb@aol.com", password_digest: "meow89234b")
  fill_in :email, with: "bb@aol.com"
  click_on "Add Friend"

  expect(current_path).to eq(user_dashboard_path(@user.id))
  expect(page).to_not have_content("You currently have no friends 😭")
  expect(page).to have_content("bb@aol.com")
 end

 it 'can not add a friend if that friend is not a user' do
   fill_in :email, with: "nico@hotmail.com"
   click_on "Add Friend"

   expect(page).to have_content("That user does not exist, please try again!")
   expect(page).to_not have_content("nico@hotmail.com")
   expect(page).to have_content("You currently have no friends 😭")
 end

 it 'can not add a duplicate friend' do
   friend = User.create!(email: "bb@aol.com", password_digest: "meow89234b")
   friendship = Friendship.create!(user_id: @user.id, friend_id: friend.id)

   visit user_dashboard_path(@user.id)

   expect(page).to have_content("bb@aol.com")
   fill_in :email, with: "bb@aol.com"
   click_on "Add Friend"

   expect(page).to have_content("This user is already your friend!")
   expect(page).to have_content("bb@aol.com", count: 1)
 end
end
