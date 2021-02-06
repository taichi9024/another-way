class LikesController < ApplicationController
    def create
        Like.create(user_id:current_user.id, space_id: params[:space_id])
        redirect_to space_path(params[:space_id])
    end

    def destroy
        @like = current_user.likes.where(space_id: params[:space_id]).first
        @like.delete
        redirect_to space_path(params[:space_id])
    end
end
