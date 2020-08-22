class UsersController < ApplicationController
  def joinings
    @user = User.find_by(id: params[:id])
    @projects = @user.joinings
  end

  def todo
    @user = User.find_by(id: params[:id])
    @tasks = @user.tasks.where(status: 0).order('created_at DESC')
  end  

  def doing
    @tasks_and_daily_tasks = TaskCollection.new(current_user,[],[])

    # @daily_tasks = current_user.daily_tasks.where(add_date: Date.today)

    # @daily_tasks = current_user.daily_tasks.where(add_date: Date.today)
    # @tasks = @daily_tasks.map do |daily_task|
    #   daily_task = daily_task.task
    # end
    # @tasks_and_daily_tasks = TaskCollection.new(@daily_tasks,@tasks)
    # binding.pry
  end

  def done
    @user = User.find_by(id: params[:id])
    @tasks = @user.tasks.where(status: 1).order('created_at DESC')
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
