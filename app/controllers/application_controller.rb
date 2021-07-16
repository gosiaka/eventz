class ApplicationController < ActionController::Base
  
  # avaliable for all controllers
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  # avaliable for all views
  helper_method :current_user

end
