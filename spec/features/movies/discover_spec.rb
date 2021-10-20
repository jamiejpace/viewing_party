require 'rails_helper'

RSpec.describe 'movie discover page', :vcr do
  before :each do
    current_user = User.create!(email: "mose@gmail.com", password_digest: "198hsidfj48c")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    visit discover_path
  end

  it 'can display discover sections' do
    expect(page).to have_button("Discover Top 40 Movies!")
    expect(page).to have_field(:movie_search)
    expect(page).to have_button("Find Movies")
  end

  it 'can reroute to movies path with top 40 showing' do
    click_on 'Discover Top 40 Movies!'

    expect(current_path).to eq(movies_path)
    expect(page).to have_button("Discover Top 40 Movies!")
    expect(page).to have_field(:movie_search)
    expect(page).to have_button("Find Movies")
  end
end
