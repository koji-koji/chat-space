class UserSearchController < ApplicationController
  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.json
    end
  end
end
