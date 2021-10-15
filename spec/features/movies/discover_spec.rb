require 'rails_helper'

# As an authenticated user,
# When I visit the '/discover' path
# I should see
#  Button to Discover top 40 movies x
#  A text field to enter keyword(s) to search by movie title x
#  A Button to Search by Movie Title x
# When the user clicks on the top 40 button they should be taken to the movies page.
# When the user clicks on the Search button they should be taken to the movies page
# The movies will be retrieved by consuming The MovieDB API

RSpec.describe 'movie discover page' do
  before :each do
    visit discover_path
  end

  it 'can display discover sections' do
    expect(page).to have_button("Discover Top 40 Movies!")
    expect(page).to have_field(:movie_search, with: "Search By Movie Title")
    expect(page).to have_button("Find Movies")
  end
end
