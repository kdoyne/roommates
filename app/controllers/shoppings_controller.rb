class ShoppingsController < ApplicationController
  before_action :current_house, only: [:index, :create]

  def index
    @shoppings = Shopping.order("created_at").where(house_id: @current_house)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @shoppings }
    end
  end

  def update
    @shopping = Shopping.find(params[:id])
    if @shopping.update(shopping_params)
      render json: @shopping
    else
      render status: 400, nothing: true
    end
  end

  def create
    @shopping = Shopping.new(shopping_params)
    @shopping.house_id = @current_house.id
    if @shopping.save
      render json: @shopping
    else
      render status: 400, nothing: true
    end
  end

  def destroy
    @shopping = Shopping.find(params[:id])

    if @shopping.destroy 
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

private


  def shopping_params
    params.require(:shopping).permit(:item, :purchased)
  end



end