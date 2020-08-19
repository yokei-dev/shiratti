class TasksController < ApplicationController
	before_action :authenticate_user!

	def index
		@tasks = Task.all
	end

	def show
	end

	def new
		@task = Task.new
	end

	def create
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
		@task.destroy
		flash[:success] = 'タスクを削除しました。'
    redirect_back(fallback_location: root_path)
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update

	end

	private
		def task_params
			params.require(:task).permit(:content, :deadline, :status)
				# .merge(user_id: current_user.id, project_id: )
		end
end
