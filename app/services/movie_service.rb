class MovieService
  class << self
    def top_movies(page_number)
      response = conn.get("/3/discover/movie?sort_by=popularity.desc&include_adult=false&page=#{page_number}") do |req|
        req.params['api_key'] = ENV['movies_api_key']
      end
      body = JSON.parse(response.body, symbolize_names: true)
      body[:results]
    end

    private

    def conn
      Faraday.new('https://api.themoviedb.org')
    end
  end
end
