class FeedbacksMailer < ApplicationMailer
  def send_feedback(email, feedback)
    @email = email
    @feedback = feedback

    mail to: 'hunter298@yandex.ru', subject: 'Feedback'
  end
end