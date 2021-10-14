require 'rails_helper'

RSpec.describe 'user dashboard page' do
  before :each do
    visit registration_path
    fill_in :email, with: "mose@gmail.com"
    fill_in :password, with: "snacksplease"
    fill_in :password_confirmation, with: "snacksplease"

    click_on "Register"

    @user = User.last
  end

 it 'displays dashboard sections' do
   expect(page).to have_content("Welcome #{@user.email}!")
   expect(page).to have_button("Discover Movies")

   within "#friends" do
     expect(page).to have_content("Friends")
   end

   within "#parties" do
     expect(page).to have_content("Viewing Parties")
   end
 end

 it 'redirects to discover page with button' do
   click_on "Discover Movies"

   expect(current_path).to eq(discover_path)
 end
end
