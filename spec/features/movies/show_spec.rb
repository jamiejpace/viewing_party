require 'rails_helper'

RSpec.describe 'movies show page', :vcr do
  before :each do
    current_user = User.create!(email: "mose@gmail.com", password_digest: "198hsidfj48c")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  it 'links to movie show page from the index page' do
    visit movies_path

    click_button "Discover Top 40 Movies!"
    click_link "Venom"

    expect(current_path).to eq(movie_path(335983))
  end

  it 'displays movie details' do
    visit movie_path(335983)

    expect(page).to have_button("Create a Viewing Party For This Movie!")
    expect(page).to have_content("Vote Average:")
    expect(page).to have_content("Runtime:")
    expect(page).to have_content("Summary:")
    expect(page).to have_content("Genre(s):")
  end

  it 'can redirect to the create a new party page' do
    visit movie_path(335983)

    click_button "Create a Viewing Party For This Movie!"

    expect(current_path).to eq(new_party_path)
  end

  it 'has a button fo find similar movies that routes to the movies page' do
    visit movie_path(335983)

    click_button "Not The One? Check Out Similar Moives!"

    expect(current_path).to eq(movies_path)
    expect(page).to have_content("Aquaman")
  end
end
