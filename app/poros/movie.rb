class Movie
  attr_reader :title,
              :vote_average,
              :poster

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @poster = data[:poster_path]
  end
end
