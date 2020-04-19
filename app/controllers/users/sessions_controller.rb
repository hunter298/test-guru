# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  after_action :custom_welcome, only: [:create]

  private

  def custom_welcome
    if current_user.first_name == nil && current_user.last_name == nil
      flash[:notice] = "Hello, guru!"
    else
      flash[:notice] = "Hello, #{current_user.first_name} #{current_user.last_name}!"
    end
  end
end
