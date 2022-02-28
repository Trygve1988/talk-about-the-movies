class DiscussionsController < ApplicationController
  before_action :set_discussion, only: %i[ show edit update destroy ]

  # GET /discussions or /discussions.json
  def index
    @discussions = Discussion.all
  end

  # GET /discussions/1 or /discussions/1.json
  def show
    @post = Post.new
    @posts = Post.where(discussion: @discussion)
  end

  # POST /discussions or /discussions.json
  def create
    @discussion = Discussion.new(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to movie_url(@discussion.movie), notice: "Discussion was successfully created." }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1 or /discussions/1.json
  def destroy
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to movie_url(@discussion.movie), notice: "Discussion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discussion_params
      params.require(:discussion).permit(:user_id, :movie_id, :title)
    end
end
