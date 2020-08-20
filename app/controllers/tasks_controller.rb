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

    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to root_path
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
	end

	private
		def task_params
			params.require(:task).permit(:content, :deadline, :project_id, :user_id)
		end
end
