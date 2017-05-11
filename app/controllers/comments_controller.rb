class CommentsController < ApplicationController
  def index
    @chatgroup = Chatgroup.find(params[:chatgroup_id])
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to chatgroup_comments_path, notice: "メッセージ送信成功！"
    else
      redirect_to chatgroup_comments_path, alert: "メッセージ送信失敗！"
    end
  end

  private

  def comment_params
    params.permit(:chatgroup_id,).merge(user_id: current_user.id,comment: params[:comment].dig("comment"))
  end
end
