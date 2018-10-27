class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, meigen_id: params[:meigen_id])
  end
end
