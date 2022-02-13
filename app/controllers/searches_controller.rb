class SearchesController < ApplicationController
  def index
    if session[:result]
      @result = session[:result]
    end
  end

  def do_searh
    Tmdb::Api.key("b86ed2181541cb582c6118debab2480b")
    @search = Tmdb::Search.new
    @search.resource('movie') # determines type of resource
    @search.query(params[:search][:text]) # the query to search against
    result_full = @search.fetch # makes request

    @result = []
    result_full.each do |movie|
      @result << movie["original_title"]
    end
    session[:result] = @result

    redirect_back(fallback_location: root_path)
  end
end
