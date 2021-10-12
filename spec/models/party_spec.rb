require "rails_helper"

RSpec.describe Party do
  describe "relationships" do
    it { should have_many(:attendees) }
    it { should have_many(:users).through(:attendees) }
  end
end
