class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:required_page]
    else
      flash.now[:alert] = 'Something wrong, check Your email and password'
      render :new
    end
  end

  def exit
    session[:user_id] = nil
    redirect_to root_path
  end
end
