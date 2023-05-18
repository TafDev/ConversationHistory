class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by(id: params[:id])

    return @project unless @project.nil?

    redirect_to projects_path, alert: t('projects.project_not_found')
  end
end
