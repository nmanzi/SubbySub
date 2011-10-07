class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :is_authed?
  
  private
  def is_authed?
    session[:authenticated]
  end
end
