class ResignController < ApplicationController
  def new
    current_user
  end

  def create
    user = User.find_by(id: current_user.id)
    reset_session
    user.delete
    redirect_to root_path, notice: 'アプリをご利用いただきありがとうございました！'
  end
end
