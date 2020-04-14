class ApplicationController < ActionController::Base

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      session[:required_page] = {controller: controller_name, action: action_name, id: params[:id]}
      redirect_to login_path, alert: 'You are not logged in!'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] # not to make redundant query to DB
  end

  def logged_in?
    current_user.present?
  end
end
