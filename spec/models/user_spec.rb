require "rails_helper"

RSpec.describe User do
  describe "relationships" do
    it { should have_many(:attendees) }
    it { should have_many(:parties).through(:attendees) }
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "instance methods" do
    describe "#current_friends" do
      it 'returns a list of all unique user friends' do
        user = User.create!(email: "mose@gmail.com", password_digest: "sldkfj4b5")
        friend1 = User.create!(email: "bb@aol.com", password_digest: "asdf4390j4b5")
        friend2 = User.create!(email: "nico@hotmail.com", password_digest: "slcxv234b5")
        Friendship.create!(user_id: user.id, friend_id: friend1.id)
        Friendship.create!(user_id: user.id, friend_id: friend2.id)

        expect(user.current_friends).to eq([friend1, friend2])
      end
    end
  end
end
