require 'rails_helper'

RSpec.describe 'movie facade', :vcr do
  it 'can return a list of the top 40 movies' do
    movies = MovieFacade.top_40_movies

    expect(movies).to be_an(Array)
    expect(movies.first).to be_a(Movie)
    expect(movies.first.title).to be_a(String)
    expect(movies.count).to eq(40)
  end
end
