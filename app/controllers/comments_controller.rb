class CommentsController < ApplicationController
  def create
    @comment = Comment.new(content: params[:content])
    @comment.space_id = params[:space_id]
    @comment.user_id = current_user.id
    @comment.save
      redirect_to "/spaces/#{params[:space_id]}/", notice: 'コメントを残しました'
  end
end
