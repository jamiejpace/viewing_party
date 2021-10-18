require 'rails_helper'

RSpec.describe 'movie service', :vcr do
  it 'gets the top 20 movies' do
    response = MovieService.top_movies(1)

    expect(response).to be_an(Array)
    expect(response.first).to have_key(:title)
    expect(response.first).to have_key(:vote_average)
  end

  it 'gets a custom search based on a search param' do
    response = MovieService.search_movies("venom", 1)

    expect(response).to be_an(Array)
    expect(response.first).to have_key(:title)
    expect(response.first).to have_key(:vote_average)
  end

  it 'gets the details of a movie given the id of that movie' do
    response = MovieService.find_movie(335983)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:title)
    expect(response).to have_key(:vote_average)
    expect(response).to have_key(:poster_path)
    expect(response).to have_key(:id)
    expect(response).to have_key(:runtime)
    expect(response).to have_key(:overview)
    expect(response).to have_key(:genres)

  end

  it 'gets the cast of a given movie' do
    response = MovieService.find_cast(335983)

    expect(response).to be_an(Array)
    expect(response.first).to have_key(:name)
    expect(response.first[:name]).to be_a(String)
    expect(response.first).to have_key(:character)
  end

  it 'gets the reviews for a given movie' do
    response = MovieService.find_reviews(335983)

    expect(response).to be_an(Array)
    expect(response.first).to have_key(:author)
    expect(response.first[:author]).to be_a(String)
    expect(response.first).to have_key(:content)
    expect(response.first[:content]).to be_a(String)
  end
end
