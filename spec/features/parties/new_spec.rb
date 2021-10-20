require 'rails_helper'

RSpec.describe 'new party page' do
  before :each do
    @current_user = User.create!(email: "mose@gmail.com", password_digest: "198hsidfj48c")
    @bb = User.create!(email: "bb@thecat.com", password_digest: "f00d15g00d")
    @nico = User.create!(email: "nico@sleepyboy.com", password_digest: "m30w198")
    @friendship = Friendship.create!(user_id: @current_user.id, friend_id: @bb.id)
    @friendship2 = Friendship.create!(user_id: @current_user.id, friend_id: @nico.id)
    @party = Party.create(movie_title: "Venom", date: '2021-10-31 20:00:00 -0600', time: '2021-10-31 20:00:00 -0600', movie_runtime: 112)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

    visit movie_path(335983)
    click_button "Create a Viewing Party For This Movie!"
  end

  it 'displays the movie title and all form information', :vcr do
#  As an authenticated user,
#   When I visit the new viewing party page,
#   I should see the name of the movie title rendered above a form with the following fields: x
#     Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie x
#     When: field to select date x
#     Start Time: field to select time x
#     Checkboxes next to each friend (if user has friends) x
#     Button to create a party x
#   When the party is created, the authenticated user should be redirected back to the dashboard where the new event is shown. The event should also be seen by any friends that were invited when they log in.

    expect(page).to have_content("Create a Viewing Party for")
    expect(page).to have_content("Party Date:")
    expect(page).to have_content("Party Duration:")
    expect(page).to have_content("Party Time:")
    expect(page).to have_content("Invite Your Friends:")
    expect(page).to have_button("Create a Party! 🥳")
  end

  it 'can create a new party provided party information', :vcr do
    fill_in :date, with: '2021/10/31'
    select '08 PM', :from => "[time(4i)]"
    select '00', :from => "[time(5i)]"

    within "#friend-#{@current_user.friends.first.id}" do
      check 'invited[]'
    end
    within "#friend-#{@current_user.friends.last.id}" do
      check 'invited[]'
    end

    click_on "Create a Party! 🥳"

    expect(current_path).to eq(user_dashboard_path(@current_user.id))
    expect(page).to have_content("Host: #{@current_user.email}")
    expect(page).to have_content("Date: October 31, 2021")
    expect(page).to have_content("Time: 08:00 PM")
    expect(page).to have_content(@current_user.email)
    expect(page).to have_content(@bb.email)
    expect(page).to have_content(@nico.email)
  end

  it 'can display an error if valid information is not provided and/or friends are not invited', :vcr do
    select '08 PM', :from => "[time(4i)]"
    select '00', :from => "[time(5i)]"


    within "#friend-#{@current_user.friends.first.id}" do
      check 'invited[]'
    end
    within "#friend-#{@current_user.friends.last.id}" do
      check 'invited[]'
    end

    click_on "Create a Party! 🥳"
    
    expect(current_path).to eq(movie_path(335983))
    expect(page).to have_content("Could not create a party, please enter valid information and try again!")
  end
end
