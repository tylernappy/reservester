class RestaurantsController < ApplicationController
  #before_filter :find_restaurant, only: [:show, :edit]
  def index
  	@restaurants = Restaurant.all
    #@result = Restaurant.multiply(params[:num1], params[:num2])
  end

  def show
   @restaurant = Restaurant.find(params[:id])
  end

  def new
  	@restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end


 
  def create
  	@restaurant = Restaurant.new(params[:restaurant].permit(:name, :description, :address, :phone))

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render action: "new"
    end
  	# @restaurant = Restaurant.new(restaurant_params)

  	# @restaurant.save
  	# redirect_to @restaurant

  	# render text: params[:restaurant].inspect
  end	

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(params[:restaurant].permit(:name, :description, :address, :phone))
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render action: "edit" #"redirect to somewhere else"
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_url
  end

  private
  def post_params
  	params.require(:restaurant).permit(:name, :description, :address, :phone, :image)
  end

  # def find_restaurant
  #   @restaurant = Restaurant.find(params[:id])
  # end

end
