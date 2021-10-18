require 'rails_helper'

RSpec.describe 'new party page' do
  before :each do
    current_user = User.create!(email: "mose@gmail.com", password_digest: "198hsidfj48c")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

    visit movie_path(335983)
    click_button "Create a Viewing Party For This Movie!"
  end

  it 'displays the movie title and all form information', :vcr do
#  As an authenticated user,
#   When I visit the new viewing party page,
#   I should see the name of the movie title rendered above a form with the following fields:
#     Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
#     When: field tso select date
#     Start Time: field to select time
#     Checkboxes next to each friend (if user has friends)
#     Button to create a party
#   Details When the party is created, the authenticated user should be redirected back to the dashboard where the new event is shown. The event should also be seen by any friends that were invited when they log in.
    # save_and_open_page
    expect(page).to have_content("Create a Viewing Party for movie_title")
    expect(page).to have_content("Party Date:")
    expect(page).to have_content("Movie Runtime:")
    expect(page).to have_content("Party Time:")
    expect(page).to have_content("Your Friends:")
    expect(page).to have_button("Create a Party! 🥳")
  end
end
