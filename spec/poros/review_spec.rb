require 'rails_helper'

RSpec.describe 'review poro' do
  it 'exists and has attributes' do
    review = Review.new(author: "movie_LoVeR_626", content: "This movie sucked.")

    expect(review).to be_a(Review)
    expect(review.author).to eq("movie_LoVeR_626")
    expect(review.content).to eq("This movie sucked.")
  end
end
