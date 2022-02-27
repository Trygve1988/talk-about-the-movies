class SearchesController < ApplicationController
  before_action :set_search, only: %i[ show edit update destroy ]

  # GET /searches or /searches.json
  def index
    @search = Search.new
    if session[:result]
      @result = session[:result]
    end
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # POST /searches or /searches.json
  def create
    @search = Search.new(search_params)

    if @search.save
      puts "AAAAAAAAAAAAAAAAAAa #{search_params[:text]} "

      Tmdb::Api.key("b86ed2181541cb582c6118debab2480b")
      @request= Tmdb::Search.new
      @request.resource('movie') # determines type of resource
      @request.query(search_params[:text]) # the query to search against
      result_full = @request.fetch # makes request

      @result = []
      result_full.each do |movie|
        @result << movie["original_title"]
      end
      session[:result] = @result

      redirect_back(fallback_location: root_path)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_params
      params.require(:search).permit(:text)
    end
end
