class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:required_page) || root_path
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
