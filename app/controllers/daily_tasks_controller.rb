class DailyTasksController < ApplicationController
  def create
    @daily_task = DailyTask.new(daily_task_params)
    if @daily_task.save
      redirect_to 
    else
      render 
    end
      
  end




  private 
  
  def daily_task_params
    params.require(:daily_task).permit(:user_id,:task_id,:add_date,:condition)
  end
end
