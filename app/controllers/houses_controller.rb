class HousesController < ApplicationController

  def index
    @house = House.find_by street_address: params[:query]
    render json: @house
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @house.save 
    current_user.house = @house
    current_user.save
    redirect_to house_path(@house)
  end

  def show
    @house = House.find(params[:id])
  end

  private 

  def house_params
    params.require(:house).permit(:street_address, :city, :state)
  end

end