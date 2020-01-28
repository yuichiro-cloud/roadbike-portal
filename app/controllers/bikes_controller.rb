class BikesController < ApplicationController
  before_action :bike_params, only: [:create]

  def index
    # binding.pry
    @bikes = Bike.all
    # binding.pry
    # @bike = Bike.search(params[:search])
    # binding.pry
  end

  def new
    # binding.pry
    @bike = Bike.new
    # @bike.brands.new
    # binding.pry
    # @bike = Bike.new
    # binding.pry
    # @bike.brand << params
    # @bike.kind
    # @bike.image
    # @bike.price
    # @bike.weight
  end

  def search
    if params[:search].present?
      @forms = Bike.where(model:"#{params[:search]}")
    elsif params[:format].present?
      @bike = Bike.find(params[:format])
      @bikes = Bike.where(brand:"#{@bike.brand}")
    else
      @bikes = Bike.none
      @forms = Bike.none
    end
  end

  def show
    # binding.pry
    @bike = Bike.find(params[:id])
    @comments = @bike.comments
    # binding.pry
    # @bike = @bikes.find(1)
    # @comment = Comment.find_by(bike_id: params[:id])
    # binding.pry
    # render template: "comments/index"
    # binding.pry

    # binding.pry
  end

  def create
    # binding.pry
    @bike = Bike.new(bike_params)
    # @brand = Brand.new(params[:bike][:brand])
    # @bike = Bike.new(bike_params)
    # binding.pry
    if @bike.save
      redirect_to root_path
    else
      render :new
      
    end
    
    

  end

  

  private
  # def bike_params
  #   params.require(:bike).permit(:brand_id)
  # end
    def bike_params
      params.require(:bike).permit(:model, :price, :weight, :brand)
    end

    # def set_bike
    #   @bike = Bike.find()
    # end

  #   def brand_params
  #     params.require(:brand).permit(:)
      
  #   end
    
  end
