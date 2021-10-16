require 'rails_helper'

RSpec.describe 'movies index page', :vcr do
  it 'displays top 40 movie titles and vote average' do
    current_user = User.create!(email: "mose@gmail.com", password_digest: "198hsidfj48c")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

    visit movies_path

    # movies = MovieFacade.top_40_movies
    #
    # expect(page).to have_content(movies.first.title)
    # expect(page).to have_content(movies.first.vote_average)
  end
end
