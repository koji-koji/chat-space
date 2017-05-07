class ChatgroupsController < ApplicationController

  def new
    @chatgroup = Chatgroup.new
  end

  def create

    chatgroup = Chatgroup.new(group_name: params[:chatgroup][:group_name])

    if chatgroup.save(group_params)
      redirect_to root_path, notice: "グループ作成完了！"
    else
      redirect_to new_chatgroup_path, alert: "グループ作成失敗"
    end
  end

  def edit
  end

  private
  def group_params
    params.require(:chatgroup).permit(:name)
  end

end

