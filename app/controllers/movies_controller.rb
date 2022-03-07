class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
    @discussion = Discussion.new
    @discussions = Discussion.where(movie: @movie)
  end

  # POST /movies or /movies.json
  def create
    title = params[:title]
    # finnes filmen fra før?
    @movie = Movie.where(title: title).first
    if @movie
      redirect_to @movie
    else
      @movie = Movie.new()
      @movie.title = title
      if @movie.save
        redirect_to @movie
      else
        flash[:notice] = @movie.errors.full_messages.to_sentence
        redirect_back(fallback_location: root_path)
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title)
    end
end
