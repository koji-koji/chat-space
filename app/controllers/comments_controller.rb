class CommentsController < ApplicationController
  def index
    @chatgroup = Chatgroup.find(params[:chatgroup_id])
    @comment = Comment.new
  end
end
