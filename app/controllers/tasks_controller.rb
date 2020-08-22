class TasksController < ApplicationController
	before_action :authenticate_user!

	def show
	end

	def new
		@task = Task.new
	end

	def create
    # binding.pry #idを渡すとき、eachか何かで回す
    if params[:task] && params[:task][:content]
      @task = Task.new(task_params)
      if @task.save
        flash[:success] = 'タスクを投稿しました。'
        if @task.project_id == nil
          redirect_to controller: :users, action: :todo, id: current_user.id
        else
          redirect_to project_url(id: @task.project_id)
        end
      else
        flash.now[:danger] = 'タスクの投稿に失敗しました。'
        render :new
      end
    else
      @tasks = TaskCollection.new(current_user, tasks_collection_params,daily_tasks_collection_params)
      # binding.pry
      if @tasks.save
        redirect_to root_url
      else
        render :new
      end
    end
  end


	def destroy
		#binding.pry
		@task = Task.find(params[:id])
		@task.destroy
		flash[:success] = 'タスクを削除しました。'
    redirect_to root_url
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
    @task = Task.find(params[:id])
    # binding.pry
    if params[:task][:status] == "0"	
      if params[:daily_task].present?
        @daily_task = DailyTask.find(params[:daily_task_id])
        if @daily_task.update(daily_task_update_params)
          redirect_back(fallback_location: root_path)
        else
          render 'users/doing'
        end
      else
        if @task.update(task_params)
          flash[:success] = 'タスクは正常に更新されました'
          redirect_back(fallback_location: root_path)
        else
          flash.now[:danger] = 'タスクは更新されませんでした'
          render :edit
        end
      end
    else
      @daily_task = DailyTask.find(params[:daily_task_id])
      if @task.update(task_update_params) && @daily_task.update(daily_task_update_params)
        redirect_back(fallback_location: root_path)
      else
        render 'users/doing'
      end
    end
  end

	private
  def task_params
    unless params[:task][:project_id].present?
      params.require(:task).permit(:content, :deadline, :project_id, :status).merge(user_id: current_user.id)#プロジェクトidがない場合
    else
      params.require(:task).permit(:content, :deadline, :project_id, :user_id, :status)#プロジェクトidがある場合（ユーザーへの割り振りはこちら）
    end
  end

	def task_update_params
	  params.require(:task).permit(:status)
  end

  def daily_task_update_params
    params.require(:daily_task).permit(:condition,:comment)
  end

  def tasks_collection_params
    # binding.pry
    params.require(:tasks)
  end

  def daily_tasks_collection_params
    params.require(:daily_tasks)
  end


end