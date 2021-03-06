class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You Have Successfully Logged In!"
      redirect_to root_path
    else
      flash.now[:danger] = "There Is Something Wrong With Your Email Or Password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You Have Logged Out!"
    redirect_to root_path
  end
end
