class TasksController < ApplicationController
	before_action :authenticate_user!

	def index
		@tasks = User.find_by(id: params[:id]).tasks.order('created_at DESC')
	end

	def show
	end

	def new
		@task = Task.new
	end

	def create
		#binding.pry
		@task = Task.new(task_params)
		if @task.save
			flash[:success] = 'タスクを投稿しました。'
			redirect_to root_path
		else
			flash.now[:danger] = 'タスクの投稿に失敗しました。'
			render :new
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
    # if params.status == 0	
      if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
      end
    # else
    #   if @task.update(task_status_params)
    #     redirect_to root_path
    #   else
    #     render 'users/doing'
    #   end
    # end
  end

	private
    def task_params
      unless params[:task][:project_id].present?
        params.require(:task).permit(:content, :deadline, :project_id).merge(user_id: current_user.id)
      else
        params.require(:task).permit(:content, :deadline, :project_id, :user_id)
      end
		end

		# def task_status_params
		#   params.require(:task).permit(:status)
		# end
end
