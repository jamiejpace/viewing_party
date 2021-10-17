class Movie
  attr_reader :title,
              :vote_average,
              :poster,
              :id,
              :runtime,
              :summary

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @poster = data[:poster_path]
    @id = data[:id]
    @runtime = data[:runtime]
    @summary = data[:overview]
    @genres = data[:genres]
  end

  def genre_names
    genre = @genres.map do |genre|
      genre[:name]
    end
    genre.join(", ")
  end
end
