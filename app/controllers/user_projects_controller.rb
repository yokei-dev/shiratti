class UserProjectsController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    current_user.join(project)
    flash[:success] = 'プロジェクトに参加しました'
    redirect_to projects_url(id: current_user.id)
    #redirect_to project_user_url
    end
  
  def destroy
    project = Project.find(params[:project_id])
    current_user.unjoin(project)
    flash[:success] = 'プロジェクトから抜けました'
    redirect_back(fallback_location: projects_url)
  end
end
