class FeedbackMailer < ApplicationMailer

  def send_message(feedback)
    @mailer = feedback.email
    @message = feedback.message

    mail to: Admin.pluck(:email).join(', ')
  end

end