class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbacksMailer.send_feedback(feedback_params).deliver_now
      redirect_to root_path, notice: t('.sent')
    else
      flash[:alert] = "Wrong data"
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :feedback)
  end
end