class AdminsController < ApplicationController
  def welcome
  end

  def authenticate
    user = User.find_by(name: authentication_params[:name])
    if user && user.name = 'Admin'
      user_logged_in = user.authenticate(authentication_params[:password])
      if user_logged_in
        session[:current_user_id] = user_logged_in.id
        redirect_to admin_console_path
      else
        flash[:notice] = "Incorrect password"
        redirect_to admin_path
      end
    else
      flash[:notice] = "You're not an admin ya foo!"
      redirect_to admin_path
    end
  end

  def console
    if !@current_user.admin
      redirect_to users_path
    end
  end

private
  def authentication_params
    params.permit(:name, :password)
  end
end
