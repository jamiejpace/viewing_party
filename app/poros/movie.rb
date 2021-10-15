require 'rails_helper'
class Movie

  attr_reader :title,
              :average_vote
              
  def initialize(data)
    @title = data[0][:original_title]
  end
end
