require "rails_helper"

RSpec.describe Friendship do
  describe "relationships" do
    it { should belong_to(:friend) }
    it { should belong_to(:inverse_friend) }
  end
end
