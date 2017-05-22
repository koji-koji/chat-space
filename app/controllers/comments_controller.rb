class CommentsController < ApplicationController
  before_action :group_set, only: [:index, :create]

  def index
    @comment = Comment.new
    @comments = Comment.order('created_at ASC')
  end

  def create
    @comment = @chatgroup.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to chatgroup_comments_path }
        format.json
      end
    else
      flash.now[:alert] = "メッセージ送信失敗！"
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :image).merge(user_id: current_user.id)
  end

  def group_set
    @chatgroup = Chatgroup.find(params[:chatgroup_id])
  end

end
