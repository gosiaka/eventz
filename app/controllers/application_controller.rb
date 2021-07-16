class ApplicationController < ActionController::Base

private

  # avaliable for all controllers
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  # avaliable for all views
  helper_method :current_user

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def current_user_admin?
    current_user && current_user.admin?
  end

  helper_method :current_user_admin?

  def require_sign_in
    unless current_user
      session[:intendent_url] = request.url
      redirect_to new_session_path, alert: "Please sign in"
    end
  end

  def require_admin
    unless current_user_admin?
      redirect_to events_path, alert: "Unauthorized access!"
    end
  end

end
