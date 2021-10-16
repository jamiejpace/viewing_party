require 'rails_helper'

RSpec.describe 'movie service', :vcr do
  it 'get the top 20 movies' do
    response = MovieService.top_movies(1)

    expect(response).to be_an(Array)
    expect(response.first).to have_key(:title)
    expect(response.first).to have_key(:vote_average)
  end
end
