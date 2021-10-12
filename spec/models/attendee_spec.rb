require "rails_helper"

RSpec.describe Attendee do
  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end
end
