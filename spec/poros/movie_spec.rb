require 'rails_helper'

RSpec.describe 'movie poro' do
  it 'exists and has attributes' do
    movie = Movie.new(title: "Home Alone", vote_average: 7.3, poster_path: "/t/p/w300/9wSbe4CwObACCQvaUVhWQyLR5Vz.jpg", id: 771, runtime: 103, overview: "Kevin is left home alone.", genres: [{name: "Comedy"},{name: "Family"}])

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq("Home Alone")
    expect(movie.summary).to eq("Kevin is left home alone.")
  end

  it 'can return the genres as one string' do
    movie = Movie.new(title: "Home Alone", vote_average: 7.3, poster_path: "/t/p/w300/9wSbe4CwObACCQvaUVhWQyLR5Vz.jpg", id: 771, runtime: 103, overview: "Kevin is left home alone.", genres: [{name: "Comedy"},{name: "Family"}])

    expect(movie.genre_names).to eq("Comedy, Family")
  end
end
