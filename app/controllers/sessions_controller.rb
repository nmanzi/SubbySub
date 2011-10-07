class SessionsController < ApplicationController
  def new
    if session[:authenticated]
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
    if username == "admin" && password == "admin"
      return true
    end
  end
end
