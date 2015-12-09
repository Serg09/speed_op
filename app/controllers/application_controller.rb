class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def new_user
    @current_user.password = nil
  end

  # this method allows the method to be accessed in views
  helper_method :current_user
  helper_method :new_user

end
