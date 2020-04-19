# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  after_action :custom_welcome, only: [:create]

  private

  def custom_welcome
    flash[:notice] = "Hello, #{current_user.first_name}!" if flash.key?(:notice)
  end
end
