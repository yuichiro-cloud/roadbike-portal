class ChatsController < ApplicationController
  before_action :set_group
  def index
    @chat = Chat.new
    @chats = @group.chats.includes(:user)
    # binding.pry
    # @user = User.find(@chats.user_id)

    # binding.pry
  end

  def create
    # binding.pry
    @chat = @group.chats.new(chat_params)
    # binding.pry
    @user = User.find(@chat.user_id)
    # binding.pry
    if @chat.save
      respond_to do |format|
        format.html {redirect_to group_chats_path(params[:group_id])}
        format.json
      end
    else
      @chats = @group.chats.includes(:user)
      render :index
    end
    # binding.pry
    # if @chat.save
    #   render :index
    # else
    #   render :index
    # end
  end
  private
  def chat_params
    # binding.pry
    params.require(:chat).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
