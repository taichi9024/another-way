class FeedbackMailer < ApplicationMailer
  def feedback_send(feedback)
    @feedback = feedback
    mail(
      subject: 'フィードバック送信完了メール',
      to: @feedback.email.to_s
    )
  end
end
