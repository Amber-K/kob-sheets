class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:intended_url] || characters_path, notice: "Successfully Signed In"
      session[:intended_url] = nil
    else
      flash.now[:alert] = "Invalid Account"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully Signed Out"
  end

end
