class BikesController < ApplicationController
  before_action :bike_params, only: [:create]
  before_action :set_seller_user,only: [:out,:first,:report]
  
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
    if @user.banned == nil
    else
    end
  end
  
  def new
    if current_user.banned != nil
      redirect_to root_path
      flash.now[:alert] = "凍結されています"
    else
      @bike = Bike.new
      @images = @bike.images.new
    end
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
    # binding.pry
    if current_user.banned == nil   #凍結されていると投稿できない
      @bike = Bike.new(bike_params)
      # binding.pry
      if @bike.save
        redirect_to root_path
      elsif params[:bike][:images_attributes] == nil    #画像がなかった場合
        @images = @bike.images.new
        render action: :new
      else    #画像があった場合
        render action: :new
        # redirect_to new_bike_path
      end
    else        
    end
  end

  def out
      @info = 0
  end

  def report   
    @danger = Danger.new(reported: @seller.id, reporter: current_user.id)  #まずはここでdangerテーブルに通報情報を登録する
    if @danger.save
    else
      flash[:失敗]
    end
    @dangers = Danger.all
    @reported = @dangers.where(reported: @seller.id)     #ある人が通報されたもの全て
    @reporter_count = @reported.where(reporter: current_user.id).count   #ある出品者に対してある通報者一人が何回通報したか
    if @seller.reported == nil
      @seller.reported = 0
      @number = @seller.reported + 1.0/@reporter_count  #  1回目0 + 1/1になり@numberが1になる
    else
      @number = @seller.reported + 1.0/@reporter_count    #2回目以降の通報処理
    end
    if @number < 5.0
      @user = User.update(@seller,reported: @number)  #通報ポイントが5未満ならば通報後の通報ポイントをupdateする
      @word = "safe"
    else
      @word ="ban"
      @user = User.update(@seller,reported: 5.0,banned: @seller.id)   #通報ポイントが5を超えるとreportedに5が入りbannedに@sellerのidが入る
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
