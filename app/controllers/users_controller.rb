class UsersController < ApplicationController
  def joinings
    @user = User.find_by(id: params[:id])
    @projects = @user.joinings
  end

  def doing
    @daily_tasks = current_user.daily_tasks.where(add_date: Date.today.to_s)
  end

  def show
    @daily_tasks_0 = current_user.daily_tasks.where(add_date: Date.today)
    @daily_tasks_1 = current_user.daily_tasks.where(add_date: Date.today-1)
    @daily_tasks_2 = current_user.daily_tasks.where(add_date: Date.today-2)
    @daily_tasks_3 = current_user.daily_tasks.where(add_date: Date.today-3)
    @daily_tasks_4 = current_user.daily_tasks.where(add_date: Date.today-4)
    @daily_tasks_5 = current_user.daily_tasks.where(add_date: Date.today-5)
    @daily_tasks_6 = current_user.daily_tasks.where(add_date: Date.today-6)
  end


end
