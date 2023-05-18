class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    return project unless project.nil?

    redirect_to projects_path, alert: t('projects.not_found')
  end

  def update
    if project.update(project_params)
      project.project_histories.create!(event_type: 'status_change',
                                        event_body: "status changed to #{params[:project][:status]}")
      flash[:success] = t('projects.updated')
    else
      flash.now[:error] = t('projects.failed')
    end
    redirect_to project
  end

  private

  def project
    @project ||= Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:status)
  end
end
