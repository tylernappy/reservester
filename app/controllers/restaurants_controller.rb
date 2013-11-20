class RestaurantsController < ApplicationController

  before_filter :authenticate_owner!, only: [:new, :create]
  before_filter :confirm_ownership, only: [:edit, :update, :destroy]
  
  def welcome
  
  end

  def index
    @restaurants=Restaurant.all
  end
  
  def new
    if owner_signed_in?
     @restaurant = Restaurant.new
    end
  end
  
  def create
     @restaurant = current_owner.restaurants.build(restaurant_permit)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render action: "new"
    end
  end
  
  def show
  	@restaurant=Restaurant.find(params[:id])
  end

  def edit
    @restaurant=Restaurant.find(params[:id])
  end

  def update
    @restaurant=Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_permit)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @restaurant=Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end

private
  def restaurant_permit
    params.require(:restaurant).permit(:name, :description, :address, :phone, :city, :state, :image)
  end


  def confirm_ownership
    restaurant = Restaurant.find(params[:id])
    if restaurant.owner != current_owner
      redirect_to :back, flash: {:alert =>"you don't own this restaurant."}
    end
  end
end

  # def post_params
  # 	params.require(:restaurant).permit(:name, :description, :full_address, :phone_number, :image)
  # end


