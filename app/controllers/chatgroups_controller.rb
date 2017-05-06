class ChatgroupsController < ApplicationController

  def new
    @chatgroup = Chatgroup.new
  end

  def create
    Chatgroup.create(group_name: params[:chatgroup][:group_name])
  end

  def edit
  end



end
