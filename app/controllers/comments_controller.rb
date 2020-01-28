class CommentsController < ApplicationController
  before_action :set_bike
  def index
    @comments = @bike.comments
    # binding.pry
    # @comments = @bike.comments.find(params[:id])
    # binding.pry
  end

  def new
    @comment = @bike.comments.new
  end
  def create
    # binding.pry
    @comment = @bike.comments.create(comment_params)
    # binding.pry
    redirect_to bike_path(params[:bike_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
  def set_bike
    @bike = Bike.find(params[:bike_id])
  end
end
