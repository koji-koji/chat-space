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
    params.permit(:chatgroup_id,).merge(user_id: current_user.id,comment: params[:comment].dig("comment"))
  end
end
