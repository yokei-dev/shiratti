class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save 
      flash[:success] = 'プロジェクトを登録しました'
      redirect_to projects_url
    else
      flash.now[:danger] = 'プロジェクトの登録に失敗しました'
      render 'projects/index'
    end
  end

  def destroy
    @project.destroy
    flash[:success] = 'プロジェクトを削除しました'
    redirect_to projects_url
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(message_params)
      flash[:success] = 'プロジェクトは正常に更新されました'
      redirect_to projects_url
    else
      flash.now[:danger] = 'プロジェクトは更新されませんでした'
      render :edit
    end
  end

  def show
    @projects = Project.find(params[:id])
  end

  def index
    @projects = Project.all.order('created_at DESC')
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end
end
