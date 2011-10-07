class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :is_authed?
  before_filter :require_logon
  
  private
  
  def is_authed?
    session[:authenticated]
  end
  
  def require_logon
    unless is_authed?
      flash[:error] = "You gotta log in before you can do that, dude."
      redirect_to login_path
    end
  end
end
