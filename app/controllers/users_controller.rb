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
    @tasks_and_daily_tasks = TaskCollection.new(User.find_by(params[:id]),[],[])

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
    @user = User.find_by(id: params[:id])
    @daily_tasks_0 = @user.daily_tasks.where(add_date: Date.today)
    @daily_tasks_1 = @user.daily_tasks.where(add_date: Date.today-1)
    @daily_tasks_2 = @user.daily_tasks.where(add_date: Date.today-2)
    @daily_tasks_3 = @user.daily_tasks.where(add_date: Date.today-3)
    @daily_tasks_4 = @user.daily_tasks.where(add_date: Date.today-4)
    @daily_tasks_5 = @user.daily_tasks.where(add_date: Date.today-5)
    @daily_tasks_6 = @user.daily_tasks.where(add_date: Date.today-6)

    
  end

end
