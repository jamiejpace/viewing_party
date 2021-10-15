class MoviesController < ApplicationController
  def discover; end

  def index; end

  def top_40
    page_1_response = conn.get("/3/discover/movie?sort_by=popularity.desc&include_adult=false&page=1") do |req|
      req.params["api_key"] = ENV["movies_api_key"]
    end

    page_2_response = conn.get("/3/discover/movie?sort_by=popularity.desc&include_adult=false&page=2") do |req|
      req.params["api_key"] = ENV["movies_api_key"]
    end
    response =
  end

  def self.conn
    conn = Faraday.new(https://api.themoviedb.org)
  end

  def self.parse_data(response)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
