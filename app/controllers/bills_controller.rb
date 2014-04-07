class BillsController < ApplicationController

  def index
    @bills = Bill.order("due_date").where(house_id: current_house)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @bills }
    end
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.user_id = current_user.id
    @bill.house_id = current_house.id
    @bill.split = @bill.amount / (current_house.users).count
    if @bill.save
      render json: @bill
    else
      render status: 400, nothing: true
    end
  end

  def destroy
    @bill = Bill.find(params[:id])
    if @bill.destroy 
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:name, :due_date, :amount, :user)
  end

end