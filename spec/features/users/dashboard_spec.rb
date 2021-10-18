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

     party = Party.create(date: 10/31/21, time: 1100)
     # As an authenticated user,
     # I should see the viewing parties I have been invited to with the following details:
     # Movie Title, which links to the movie show page (later)
     # Date and Time of Event
     # who is hosting the event
     # list of friends invited, with my name in bold

     # I should also see the viewing parties that I have created with the following details:
     # Movie Title, which links to the movie show page
     # Date and Time of Event
     # That I am the host of the party
     # List of friends invited to the viewing party

     expect(page).to have_content("All Viewing Parties")
     expect(page).to have_content("No Upcoming Parties Scheduled 🤔")
     # expect(page).to have_content(movie.title)
     # expect(page).to have_content(party.date)
     # expect(page).to have_content(party.time)
     # expect(page).to have_content(current_user.email)
     # expect(page).to have_content("My Viewing Parties:")
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
