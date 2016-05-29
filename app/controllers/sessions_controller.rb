class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.log_in(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = "Something went wrong, please try again"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
