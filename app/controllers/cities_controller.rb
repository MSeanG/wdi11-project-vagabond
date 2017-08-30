class CitiesController < ApplicationController
  def index 
    @cities = City.all
  end
#new 
def new
    @city = City.new
  end

  # create
  def create
    @city = City.create!(city_params)

    
    redirect_to city_path(@city)
  end

  #show
  def show
    @city = City.find(params[:id])
  end

  # edit
  def edit
    @city = City.find(params[:id])
  end


  # update 
  def update
    @city = City.find(params[:id])
    @city.update(city_params)

    redirect_to city_path(@city)
  end

  # destroy
  def destroy
    @city = City.find(params[:id])
    @city.destroy

    redirect_to cities_path
  end

  private
  def city_params
    params.require(:city).permit(:name, :location, :image)
  end
end