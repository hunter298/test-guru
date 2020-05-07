class FeedbacksController < ApplicationController
  def new
    @user = current_user
  end

  def create
    FeedbacksMailer.send_feedback(params[:email], params[:feedback]).deliver_now
  end
end