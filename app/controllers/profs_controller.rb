class ProfsController < ApplicationController
  def edit
    @current_user = current_user
  end

  def update
      redirect_to "/user/#{current_user.id}/", notice:"ユーザー情報を更新しました"
  end

end
