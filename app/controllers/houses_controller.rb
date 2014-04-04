class HousesController < ApplicationController

  def index
    @house = House.find_by name: params[:query]
    render json: @house
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @house.save 
    current_user.house = @house
    redirect_to house_path(@house)
  end

  def show
    @house = House.find(params[:id])
  end

  private 

  def house_params
    params.require(:house).permit(:name, :street_address, :city, :state)
  end

end