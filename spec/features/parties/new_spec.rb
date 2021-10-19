require 'rails_helper'

RSpec.describe 'new party page' do
  before :each do
    @current_user = User.create!(email: "mose@gmail.com", password_digest: "198hsidfj48c")
    @bb = User.create!(email: "bb@thecat.com", password_digest: "f00d15g00d")
    @friendship = Friendship.create!(user_id: @current_user.id, friend_id: @bb.id)
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
#     Checkboxes next to each friend (if user has friends)
#     Button to create a party
#   Details When the party is created, the authenticated user should be redirected back to the dashboard where the new event is shown. The event should also be seen by any friends that were invited when they log in.

    expect(page).to have_content("Create a Viewing Party for")
    expect(page).to have_content("Party Date:")
    expect(page).to have_content("Party Duration:")
    expect(page).to have_content("Party Time:")
    expect(page).to have_content("Invite Your Friends:")
    expect(page).to have_button("Create a Party! 🥳")
  end

  xit 'can create a new party provided party information' do
    fill_in :date, with: '2021/10/31'
    select '08 PM', :from => "party[party_time(4i)]"
    select '00', :from => "party[party_time(5i)]"

    within "#friend-#{current_user.friends.first.id}" do
      check 'invited[]'
    end
    within "#friend-#{current_user.friends.last.id}" do
      check 'invited[]'

      # click_on "Create a Party! 🥳"

      expect(current_path).to eq(dashboard_path(@current_user.id))
    end
  end
end
