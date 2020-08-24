class DailyTasksController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @daily_task = @user.daily_tasks.build(daily_task_params)
    if @daily_task.save
      redirect_back(fallback_location: root_path)
    else
      render 'tasks/index'
    end
      
  end




  private 
  
  def daily_task_params
    params.require(:daily_task).permit(:task_id).merge(add_date: Date.today)
  end
end
