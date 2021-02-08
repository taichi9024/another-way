class CommentsController < ApplicationController
  def create
    @comment = Comment.new(content: params[:content])
    @comment.space_id = params[:space_id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to space_path(@comment.space_id), notice: 'コメントを残しました'
    else
      puts 'エラー出てるよ'
    end
  end
end
