class MoviesController < ApplicationController
  def discover; end

  def index; end

  # Will end up in service
  def top_1_20
    response = conn.get("/3/discover/movie?sort_by=popularity.desc&include_adult=false&page=1") do |req|
      req.params["api_key"] = ENV["movies_api_key"]
    end
    body = JSON.parse(response.body, symbolize_names: true)
    body[:results]
  end

  # Will end up in service
  def top_21_40
    response = conn.get("/3/discover/movie?sort_by=popularity.desc&include_adult=false&page=2") do |req|
      req.params["api_key"] = ENV["movies_api_key"]
    end
    body = JSON.parse(response.body, symbolize_names: true)
    body[:results]
  end

  # Will end up facade
  def top_40_combined
    # data = top_1_20.concat(top_21_40)
    # Movie.new(data)
  end

  def self.conn
    conn = Faraday.new(https://api.themoviedb.org)
  end

  def self.parse_data(response)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
