class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]  	
  				# ||= this is or and equal which assigns a value if its not nil, so if session id is already assign it would not assign another
  end
  helper_method :current_user
end
