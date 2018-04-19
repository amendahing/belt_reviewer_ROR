class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
      User.find(session[:id]) if session[:id]
      @user = User.find(session[:id])
  end
  helper_method :current_user
end
