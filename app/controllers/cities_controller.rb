class CitiesController < ApplicationController
  load_and_authorize_resource only: [:edit, :update, :destroy]

  def index 
    @cities = City.all
  end
  #new 
  def new
    @user = current_user
    @city = City.new
  end
  
  # create
  def create
    @user = current_user
    @city = City.create!(city_params)

    
    redirect_to city_path(@city)
  end

  #show
  def show
    @city = City.find(params[:id])
  end

  # edit
  def edit
    @user = current_user
    @city = City.find(params[:id])
  end


  # update 
  def update
    @user = current_user
    @city = City.find(params[:id])
    @city.update(city_params)

    redirect_to city_path(@city)
  end

  # destroy
  def destroy
    @user = current_user
    @city = City.find(params[:id])
    @city.destroy

    redirect_to cities_path
  end

  private
  def city_params
    params.require(:city).permit(:name, :location, :image)
  end
end