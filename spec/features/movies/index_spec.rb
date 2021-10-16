require 'rails_helper'

RSpec.describe 'movies index page', :vcr do
  it 'displays top 40 movie titles and vote average' do
    current_user = User.create!(email: "mose@gmail.com", password_digest: "198hsidfj48c")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

    visit movies_path

    within "#movie-1" do
      expect(page).to have_content("Title:")
      expect(page).to have_content("Vote Average:")
    end

    within "#movie-39" do
      expect(page).to have_content("Title:")
      expect(page).to have_content("Vote Average:")
    end
  end

  it 'displays results of a search given a search param' do

  end
end
