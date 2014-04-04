class UsersController < ApplicationController

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render(:new)
    end
end

def show
  @user = current_user
  @houses = House.all
  render :show
  
end

def edit 
end

def update
  @user = current_user
  if params[:house_id] != nil
    @user.house_id = params[:house_id]
    @user.save
    render json: @user
  else
    @user.update(user_params)
    redirect_to user_path
  end
end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :house_id)
end

end