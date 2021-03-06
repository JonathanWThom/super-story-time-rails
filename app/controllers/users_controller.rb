class UsersController < ApplicationController
  def index
    # @current_user = User.find_by_id(session[:current_user_id])
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
      redirect_to user_path(@user)
      session[:current_user_id] = @user.id
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    if @current_user
      if @current_user.admin || @current_user.id == @user.id
        render :edit
      else
        redirect_to users_path
      end
    end
  end

  def authenticate
    user = User.find_by(name: authentication_params[:name])
    if user
      user_logged_in = user.authenticate(authentication_params[:password])
      if user_logged_in
        session[:current_user_id] = user_logged_in.id
        redirect_to user_path(user_logged_in)
      else
        flash[:notice] = "Incorrect password"
        redirect_to users_path
      end
    else
      flash[:notice] = "No user with that name"
      redirect_to users_path
    end
  end

  def logout
    session.clear
    redirect_to users_path
  end

private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def authentication_params
    params.permit(:name, :password)
  end
end
