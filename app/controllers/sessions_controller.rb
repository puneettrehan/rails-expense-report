class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      redirect_back_or_to user, :notice => "Logged in!"
    else
      @error_message = "Invalid Username or Password."
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logout out!"
  end
end
