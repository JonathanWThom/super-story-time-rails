class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :set_user
  def set_user
    @current_user = User.find_by_id(session[:current_user_id])
  end
end
