require 'rails_helper'

RSpec.describe 'movie facade', :vcr do
  it 'can return a list of the top 40 movies' do
    movies = MovieFacade.top_40_movies

    expect(movies).to be_an(Array)
    expect(movies.first).to be_a(Movie)
    expect(movies.first.title).to be_a(String)
    expect(movies.count).to eq(40)
  end

  it 'can return a custom list of movies given a search param' do
    movies = MovieFacade.movie_search("Venom")

    expect(movies).to be_an(Array)
    expect(movies.first).to be_a(Movie)
    expect(movies.first.title).to be_a(String)
    expect(movies.first.title).to include("Venom")
  end

  it 'can return a custom list of movies given a search param with up to 40 results' do
    movies = MovieFacade.movie_search("the")

    expect(movies).to be_an(Array)
    expect(movies.first).to be_a(Movie)
    expect(movies.first.title).to be_a(String)
    expect(movies.count).to eq(40)
  end

  it 'can return a movie that matches the given id' do
    movie = MovieFacade.movie_details(11395)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq("The Santa Clause")
    expect(movie.vote_average).to be_a(Float)
    expect(movie.runtime).to be_an(Integer)
    expect(movie.genre_names).to be_a(String)
  end

  it 'can return a cast of a movie that matches the given id' do
    movie = MovieFacade.movie_cast(10680)

    expect(movie).to be_an(Array)
    expect(movie.first.name).to eq("Emilio Estevez")
    expect(movie.first.role).to eq("Gordon Bombay")
  end

  it 'can return reviews of a movie that matches the given id' do
    movie = MovieFacade.movie_reviews(2493)

    expect(movie).to be_an(Array)
    expect(movie.first.author).to be_a(String)
    expect(movie.first.content).to be_a(String)
  end
end
