class LikesController < ApplicationController
    def create
        Like.create(user_id:current_user.id, space_id: params[:space_id])
        redirect_to space_path(params[:space_id]), notice:"お気に入り登録しました"
    end

    def destroy
        @like = current_user.likes.where(space_id: params[:space_id]).first
        @like.delete
        redirect_to space_path(params[:space_id]), danger:"お気に入り解除しました"
    end
end
