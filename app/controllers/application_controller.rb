class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user 
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def house_users(id)
    @users = Users.where(house_id: id)
  end

  def current_house
    @current_house ||= House.find_by(id: current_user.house_id)
  end

  helper_method :current_user, :logged_in?, :house_users, :current_house
  
end
