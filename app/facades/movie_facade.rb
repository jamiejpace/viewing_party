class MovieFacade
  class << self
    def top_40_movies
      data = MovieService.top_movies(1).concat(MovieService.top_movies(2))
      data.map do |movie_data|
        Movie.new(movie_data)
      end
    end

    def movie_search(search_param)
      data = MovieService.search_movies(search_param, 1).concat(MovieService.search_movies(search_param, 2))
      data.map do |movie_data|
        Movie.new(movie_data)
      end
    end

    def recommended_movies(id)
      data = MovieService.find_recommendations(id)
      data.map do |movie_data|
        Movie.new(movie_data)
      end
    end

    def movie_details(id)
      data = MovieService.find_movie(id)
      Movie.new(data)
    end

    # def movie_details(id)
    #   data1 = MovieService.find_movie(id)
    #   data2 = MovieService.find_cast(id)
    #   data3 = MovieService.find_reviews(id)
    #   Movie.new(data1, data2, data3)
    # end

    def movie_cast(id)
      data = MovieService.find_cast(id)
      data.map do |cast_data|
        Cast.new(cast_data)
      end
    end

    def movie_reviews(id)
      data = MovieService.find_reviews(id)
      data.map do |review_data|
        Review.new(review_data)
      end
    end

    def movie_trailer(id)
      data = MovieService.find_videos(id)
      find_trailer = data.find do |video|
        video[:site] == "YouTube" && video[:type] == "Trailer"
      end
      if find_trailer
        find_trailer[:key]
      end
    end
  end
end
