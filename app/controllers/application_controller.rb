class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def current_user_social
    @current_user_social ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user_social
end
