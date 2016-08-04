class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:success] = "Congrats, You're In!"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Invalid login"
      render :new
    end    #check is there a user and are they who they say they are
    #send them to the appropriate place
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
