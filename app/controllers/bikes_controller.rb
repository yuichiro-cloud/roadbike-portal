class BikesController < ApplicationController
  before_action :bike_params, only: [:create]
  
  def top
    @bikes = Bike.all
    @Brands =Bike.pluck(:brand)
    @brands = Array @Brands.uniq #重複しているブランドを省くため
    @groups = Group.all
    @chats = Chat.all
    @chats5 = Chat.all.order(created_at: "DESC").first(5) #新しい5件のチャット
    @ids = @chats5.pluck(:group_id) #group_idだけの配列を作成
    @groupIds = Array @ids.uniq #group_idが重複しているチャットを排除
    # binding.pry

  end
  
  def index
    @bikes = Bike.all
  end
  
  def show
    @bike = Bike.find(params[:id])
    @images = @bike.images
    @comments = @bike.comments
  end

  def new
    @bike = Bike.new
    @images = @bike.images.new
  end

  def search
    @bikes = Bike.where(brand: params[:format])
    if params[:search].present?
        # @search = Bike.where(model:params[:search])
        @search = Bike.where("model LIKE ?", "%#{params[:search]}%")
    end
  end
  def chat
    @chats = Chat.where(group_id: params[:group_id]).order(id:"DESC").first(4);
  end


  def create
    @bike = Bike.create!(bike_params)
    if @bike.save
      redirect_to root_path
    else
      render :new
    end
  end

  

  private
    def bike_params
      params.require(:bike).permit(:model, :price, :weight,:brand, images_attributes:[:src])
    end
    
  end
