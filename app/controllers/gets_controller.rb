class GetsController < ApplicationController
  def index
    @bikes = Bike.all
    # binding.pry
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
    # binding.pry
    # @bikes = Bike.find(params[:format])
    # @form = Bike.find(params[:format])
    # binding.pry


  #   if params[:search].present?
  #     @forms = Bike.where(model:"#{params[:search]}")
  #     # binding.pry
  #   else
  #     @forms = Bike.none
  #   end

  #   @bike = Bike.find(params[:format])
  #   # binding.pry
  #   if params[:format].present?
  #     @bikes = Bike.where(brand:"#{@bike.brand}")
  #     # binding.pry
  #   else
  #     @bikes = Bike.none
  #   end
  #   # binding.pry
  

  def show
    
  end
end
