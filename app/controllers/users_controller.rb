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
  @user.update(user_params)

end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number)
end

end