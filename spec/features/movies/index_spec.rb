require 'rails_helper'

RSpec.describe 'movies index page', :vcr do
  before :each do
    current_user = User.create!(email: "mose@gmail.com", password_digest: "198hsidfj48c")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  it 'displays top 40 movie titles and vote average' do
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
    visit movies_path

    fill_in :movie_search, with: 'Sleepless'
    click_on 'Find Movies'

    expect(current_path).to eq(movies_path)
    expect(page).to have_content('Sleepless in Seattle')
  end

  it 'displays an error message when no movies are found' do
    visit movies_path

    fill_in :movie_search, with: 'jellicle cats'
    click_on 'Find Movies'

    expect(current_path).to eq(movies_path)
    expect(page).to have_content('No Search Results Found 😿')
  end

  it 'displays an error message when no movies are found' do
    visit movies_path

    fill_in :movie_search, with: ' '
    click_on 'Find Movies'

    expect(current_path).to eq(movies_path)
    expect(page).to have_content('No Search Results Found 😿')
  end

  # Can also test for non ASCII (en-us) language characters
  # considering they can show up in search results (ex. Déjà Vu)
  xit 'displays an error message when nothing is entered into the field' do
    visit movies_path

    click_on 'Find Movies'

    message = page.find('#discover_search').native.attribute("validationMessage")

    expect(current_path).to eq(movies_path)
    # expect(page).to have_button("Find Movies", disabled: true)
    expect(message).to eq("Please fill out this field.")
  end
end
