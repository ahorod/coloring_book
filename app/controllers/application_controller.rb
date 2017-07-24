class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :admin

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin
    current_user && current_user.admin
  end

  def authorize
    redirect_to '/sign_in' unless admin
  end

end
