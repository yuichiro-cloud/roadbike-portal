class BikesController < ApplicationController
  before_action :bike_params, only: [:create]
  before_action :set_seller_user,only: [:out,:first,:manytimes]
  
  def top
    @bikes = Bike.all
    @Brands =Bike.pluck(:brand)
    @brands = Array @Brands.uniq #重複しているブランドを省くため
    @groups = Group.all
    @chats = Chat.all
    @chats5 = Chat.all.order(created_at: "DESC").first(5) #新しい5件のチャット
    @ids = @chats5.pluck(:group_id) #group_idだけの配列を作成
    @groupIds = Array @ids.uniq #group_idが重複しているチャットを排除
  end
  
  def index
    @bikes = Bike.all
  end
  
  def show
    @bike = Bike.find(params[:id])
    @images = @bike.images
    @comments = @bike.comments
    @user = User.find(@bike.user_id)
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

  def out
    if @seller.reported == nil
      @info = 0
    else
      @info = 1
    end
  end

  def manytimes   #過去に通報されたことのあるユーザー(patchメソッド)
    @danger = Danger.new(reported: @seller.id, reporter: current_user.id)  #まずはここでdangerテーブルに通報情報を登録する
    if @danger.save
    else
      flash[:失敗]
    end
    @dangers = Danger.all
    @reported = @dangers.where(reported: @seller.id)     #ある人が通報されたもの全て
    @reporter_count = @reported.where(reporter: current_user.id).count   #ある出品者に対してある通報者一人が何回通報したか
    @number = @seller.reported + 1.0/@reporter_count  #  
    @user = User.update(@seller,reported: @number)
    if @user.save
    else 
      flash[:失敗]
    end

  end

  

  private
    def bike_params
      params.require(:bike).permit(:model, :price, :weight,:brand,:reported, images_attributes:[:src]).merge(user_id: current_user.id)
    end

    def set_seller_user
      @seller = User.find(params[:user_id])
    end
    
  end
