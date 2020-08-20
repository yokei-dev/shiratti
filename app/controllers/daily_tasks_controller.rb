class DailyTasksController < ApplicationController
  def create
    @daily_task = current_user.daily_tasks.build(daily_task_params)
    if @daily_task.save
      redirect_to root_url
    else
      render 'tasks/index'
    end
      
  end




  private 
  
  def daily_task_params
    params.require(:daily_task).permit(:task_id).merge(add_date: Date.today.to_s)
  end
end
