class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      flash[:message] = "Log in to access this section!"
      redirect_to login_path
    end
  end
end