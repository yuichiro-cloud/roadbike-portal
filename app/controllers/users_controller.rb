class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @bikes = Bike.where(user_id: current_user.id)
  end

  def edit
    
  end

  def update
    
  end
private
  def user_params
    params.require(:user).permit(:name, :email, :nickname)
  end
end
