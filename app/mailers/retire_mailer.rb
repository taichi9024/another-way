class RetireMailer < ApplicationMailer
  def retire_send(user)
    @user = user
    mail(
      subject: '退会完了メール',
      to: @user.email.to_s
    )
  end
end
