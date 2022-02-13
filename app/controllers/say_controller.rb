class SayController < ApplicationController
  def movie
    Tmdb::Api.key("b86ed2181541cb582c6118debab2480b")
    @search = Tmdb::Search.new
    @search.resource('movie') # determines type of resource
    @search.query('Matrix') # the query to search against
    result_full = @search.fetch # makes request

    @result = []
    result_full.each do |movie|
      @result << movie["original_title"]
    end
  end
end
