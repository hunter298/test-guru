class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies[:required_page]
        redirect_to cookies[:required_page]
        cookies[:required_page] = nil
      else
        redirect_to root_path
      end
    else
      flash.now[:alert] = 'Something wrong, check Your email and password'
      render :new
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
