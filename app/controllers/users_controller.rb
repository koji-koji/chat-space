class UsersController < ApplicationController
  def update
    user = User.find(params[:id])
    user.update(params[:current_password])
  end

    def search
    binding.pry
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.json { render 'chatgroups', handlers: 'jbuilder' }
    end
  end
end
