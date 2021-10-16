# 
# require 'rails_helper'
#
# RSpec.describe 'movies index page', :vcr do
#   it 'get the top 20 movies' do
#     response = MovieService.top_movies(1)
#
#     expect(response).to be_an(Array)
#     expect(response).to have_key([:title])
#     expect(response).to have_key([:vote_average])
#   end
# end
