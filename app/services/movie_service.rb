class MovieService
  class << self
    # def top_1_20
    #   response = conn.get("/3/discover/movie?sort_by=popularity.desc&include_adult=false&page=1") do |req|
    #     req.params["api_key"] = ENV["movies_api_key"]
    #   end
    #   body = JSON.parse(response.body, symbolize_names: true)
    #   body[:results]
    # end
    #
    # def top_21_40
    #   response = conn.get("/3/discover/movie?sort_by=popularity.desc&include_adult=false&page=2") do |req|
    #     req.params["api_key"] = ENV["movies_api_key"]
    #   end
    #   body = JSON.parse(response.body, symbolize_names: true)
    #   body[:results]
    # end

    def top_movies(page_number)
      response = conn.get("/3/discover/movie?sort_by=popularity.desc&include_adult=false&page=#{page_number}") do |req|
          req.params["api_key"] = ENV["movies_api_key"]
        end
        body = JSON.parse(response.body, symbolize_names: true)
        body[:results]
    end

    def conn
      Faraday.new("https://api.themoviedb.org")
    end
  end
end
