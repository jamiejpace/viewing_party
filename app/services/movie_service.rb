class MovieService
  class << self
    def top_movies(page_number)
      response = conn.get("/3/discover/movie?sort_by=popularity.desc&include_adult=false&page=#{page_number}")
      body = parse_json(response)
      body[:results]
    end

    def search_movies(search_param, page_number)
      response = conn.get("/3/search/movie?en-US&page=#{page_number}&include_adult=false&query=#{search_param}")
      body = parse_json(response)
      body[:results]
    end

    def find_movie(id)
      response = conn.get("/3/movie/#{id}?language=en-US")
      parse_json(response)
    end

    def find_cast(id)
      response = conn.get("/3/movie/#{id}/credits?&language=en-US")
      body = parse_json(response)
      body[:cast]
    end

    def find_reviews(id)
      response = conn.get("/3/movie/#{id}/reviews?language=en-US&page=1")
      body = parse_json(response)
      body[:results]
    end

    def find_videos(id)
      response = conn.get("/3/movie/#{id}/videos?")
      body = parse_json(response)
      body[:results]
    end

    private

    def conn
      Faraday.new('https://api.themoviedb.org') do |req|
        req.params['api_key'] = ENV['movies_api_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
