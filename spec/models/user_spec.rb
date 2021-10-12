require "rails_helper"

RSpec.describe User do
  describe "relationships" do
    it { should have_many(:attendees) }
    it { should have_many(:parties).through(:attendees) }
    it { should have_many(:friends) }
    it { should have_many(:inverse_friends).through(:friends) }
    it { should have_many(:inverse_friends) }
    it { should have_many(:friends).through(:inverse_friends) }
  end
end
