class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])      
      session[:user_id] = user.id
      redirect_to user, notice: "Welcome back #{user.name}!"
    else
      flash.now[:alert] = "Invalid email/password combitanion!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to events_path, notice: "You're now Signed Out"
  end
  
end
