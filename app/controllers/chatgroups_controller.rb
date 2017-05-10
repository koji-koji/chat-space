class ChatgroupsController < ApplicationController

  def new
    @chatgroup = Chatgroup.new
  end

  def create
    @chatgroup = Chatgroup.new(group_params)
    if @chatgroup.save
      redirect_to root_path, notice: "グループ作成完了！"
    else
      render :new
    end
  end

  def edit
      @chatgroup = Chatgroup.find(params[:id])
      path = "redirect"
      @chatgroup.users.ids.each do |id|
        if current_user.id == id
          path = "edit"
        end
      end
      redirect_to root_path if path == "redirect"
  end

  def update
    @chatgroup = Chatgroup.find(params[:id])
    if @chatgroup.update(group_params)
      redirect_to root_path, notice: "グループ編集完了！"
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:chatgroup).permit(:group_name, { user_ids: []})
  end

end
