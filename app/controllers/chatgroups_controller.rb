class ChatgroupsController < ApplicationController

  def new
    @chatgroup = Chatgroup.new
  end

  def create
    @chatgroup = Chatgroup.new(group_params)
    # binding.pry
    if @chatgroup.save
      redirect_to root_path, notice: "グループ作成完了！"
    else
      render :new
    end
  end

  def edit
  end

  private
  def group_params
    params.require(:chatgroup).permit(:group_name)
  end

end

