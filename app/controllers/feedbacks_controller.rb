class FeedbacksController < ApplicationController
  def new

  end

  def create
    FeedbacksMailer.send_feedback(params[:email], params[:feedback]).deliver_now
    redirect_to root_path, notice: t('.sent')
  end
end