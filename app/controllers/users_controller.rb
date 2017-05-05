class UsersController < ApplicationController


  def update
    user = User.find(params[:id])
    user.update(params[:current_password])
  end

end
