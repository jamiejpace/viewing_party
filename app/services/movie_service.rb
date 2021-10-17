class MovieService
  class << self
    def top_movies(page_number)
      response = conn.get("/3/discover/movie?sort_by=popularity.desc&include_adult=false&page=#{page_number}")
      body = JSON.parse(response.body, symbolize_names: true)
      body[:results]
    end

    def search_movies(search_param, page_number)
      response = conn.get("/3/search/movie?en-US&page=#{page_number}&include_adult=false&query=#{search_param}")
      body = JSON.parse(response.body, symbolize_names: true)
      body[:results]
    end

    private

    def conn
      Faraday.new('https://api.themoviedb.org') do |req|
        req.params['api_key'] = ENV['movies_api_key']
      end
    end
  end
end
