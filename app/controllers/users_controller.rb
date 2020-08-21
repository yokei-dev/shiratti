class UsersController < ApplicationController

  def todo
    @tasks = User.find_by(id: params[:id]).tasks.order('created_at DESC')
  end

  def doing
    @daily_tasks = current_user.daily_tasks.where(add_date: Date.today.to_s)
  end

  def done
    @user = User.find(params[:id])
    @tasks = @user.tasks.where(status: 2).order('created_at DESC')
  end

end