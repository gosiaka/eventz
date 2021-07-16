class UsersController < ApplicationController

  before_action :require_sign_in, except: [:new, :create]

  def require_sign_in
    unless current_user
      redirect_to new_session_path, alert: "Please sign in"
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thanks for signing up =)"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "Account successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
        @user.destroy
        session[:user_id] = nil
      redirect_to events_path, alert: "Account successfully deleted"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end
end
