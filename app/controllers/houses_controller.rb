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
    @user = current_user 
    @user.house = @house
    @user.save
    redirect_to house_path(@house)
  end

  def show
    # binding.pry
    if current_user.house.id != params[:id].to_i
      render nothing: true, status: 401
    else
      @house = House.find(params[:id])
      render(:show)
    end
  end

  private 

  def house_params
    params.require(:house).permit(:name, :street_address, :city, :state, :passcode)
  end

end