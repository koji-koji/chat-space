class ChatgroupsController < ApplicationController
  before_action :group_set, only: [:edit, :update]

  def index
    @chatgroup = Chatgroup.find(current_user.chatgroups.ids)
  end

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
    redirect_to root_path unless @chatgroup.users.ids.include?(current_user.id)
  end

  def update
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

  def group_set
    @chatgroup = Chatgroup.find(params[:id])
  end

end
