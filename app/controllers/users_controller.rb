class UsersController < ApplicationController
  def joinings
    @user = User.find_by(id: params[:id])
    @projects = @user.joinings
  end

  def doing
    @daily_tasks = current_user.daily_tasks.where(add_date: Date.today.to_s)
  end

end
