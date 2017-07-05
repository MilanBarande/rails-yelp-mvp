class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def new
    @restaurant = Restaurant.new
  end

  def update
    set_restaurant
  end

  def show
    set_restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    set_restaurant
    @restaurant.destroy
  end

  def index
    @restaurants = Restaurant.all
  end

  def edit
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
