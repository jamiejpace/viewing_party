class MovieFacade
  class << self
    def top_40_movies
      data = MovieService.top_movies(1).concat(MovieService.top_movies(2))
      movies = data.map do |movie_data|
        Movie.new(movie_data)
      end
    end

    def movie_search(search_param)
      data = MovieService.search_movies(search_param)
      returned_movies = data.map do |movie_data|
        Movie.new(movie_data)
      end
    end
  end
end
