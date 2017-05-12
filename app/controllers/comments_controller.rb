class CommentsController < ApplicationController
  before_action :comment_set, only: [:index, :create]

  def index
    @comment = Comment.new
  end

  def create
    @comment = @chatgroup.comments.new(comment_params)
    if @comment.save
      redirect_to chatgroup_comments_path, notice: "メッセージ送信成功！"
    else
      flash.now[:alert] = "メッセージ送信失敗！"
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end

  def comment_set
    @chatgroup = Chatgroup.find(params[:chatgroup_id])
  end

end
