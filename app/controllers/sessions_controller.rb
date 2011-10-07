class SessionsController < ApplicationController
  def new
    if is_authed?
      redirect_to root_url, :flash => {:info => "Already logged in, you fool."}
    end
  end
  
  def create
    if authenticate(params[:username], params[:password])
      session[:authenticated] = true
      redirect_to root_url, :flash => {:success => "Logged in!"}
    else
      flash.now[:error] = "Invalid user/pass."
      render "new"
    end
  end
  
  def destroy
    session[:authenticated] = nil
    redirect_to root_url, :flash => {:success => "Logged out!"}
  end
  
  private
  
  def authenticate(username, password)
    if username == APP_CONFIG['username'] && password == APP_CONFIG['password']
      return true
    end
  end
end
