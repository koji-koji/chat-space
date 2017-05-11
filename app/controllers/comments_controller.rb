class CommentsController < ApplicationController
  def index
    @chatgroup = Chatgroup.find(params[:chatgroup_id])
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
  end

  private

  def comment_params
    params[:user_id] = current_user.id
    params[:comment] = params[:comment][:comment]
    params.permit(:chatgroup_id, :user_id, :comment)
  end
end
