class ResignController < ApplicationController
  def new
    current_user
  end

  def create
    user = User.find_by(id: current_user.id)
    RetireMailer.retire_send(user).deliver_now!
    reset_session
    user.destroy
    redirect_to root_path, notice: 'アプリをご利用いただきありがとうございました！'
  end
end
