class UsersController < ApplicationController
  def joinings
    @user = User.find_by(id: params[:id])
    @projects = @user.joinings
  end
end
