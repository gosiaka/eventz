class UsersController < ApplicationController

  before_action :require_sign_in, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :destroy, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @registrations = @user.registrations
    @liked_events = @user.liked_events
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
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Account successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to events_path, alert: "Account successfully deleted"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end

  def require_correct_user
    @user = User.find(params[:id])    
    # unless current_user?(@user)
    #   redirect_to events_path
    # end
    # in one line:
    redirect_to events_path unless current_user?(@user)    
  end
end
