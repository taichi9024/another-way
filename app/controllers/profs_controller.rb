class ProfsController < ApplicationController
  def edit
    @current_user = current_user
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.email = params[:email]
    @user.name = params[:name]
    @user.tel = params[:tel]
    if @user.update_attribute
      redirect_to "/user/#{current_user.id}/", notice: 'ユーザー情報を更新しました'
    else
      render :edit
    end
  end
end
