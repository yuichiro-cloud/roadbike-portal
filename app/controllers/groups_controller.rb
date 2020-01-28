class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  
  def new
    # binding.pry
    @group = Group.new
    # binding.pry
    # @group.users << current_user
  end

  def create
    # binding.pry
    @group.new(current_user.id)
  end
end
private
  def group_params
    params.require(:group).permit(:name,user_ids:[])
  end