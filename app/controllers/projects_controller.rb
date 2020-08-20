class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order('created_at DESC')
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    #binding.pry
    if @project.save 
      flash[:success] = 'プロジェクトを登録しました'
      redirect_to projects_url
    else
      flash.now[:danger] = 'プロジェクトの登録に失敗しました'
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = 'プロジェクトを削除しました'
    redirect_to projects_url
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:success] = 'プロジェクトは正常に更新されました'
      redirect_to projects_url
    else
      flash.now[:danger] = 'プロジェクトは更新されませんでした'
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
  end


  private
  def project_params
    params.require(:project).permit(:name, :boss_id)
  end
end
