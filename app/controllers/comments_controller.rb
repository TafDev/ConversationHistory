class CommentsController < ApplicationController
  def create # rubocop:disable Metrics/MethodLength
    if project.nil?
      redirect_to projects_path, alert: t('projects.not_found')
      return
    end

    @comment = project.comments.build(comment_params)

    if @comment.save
      project.project_histories.create!(event_type: 'comment',
                                        event_body: "#{params[:comment][:username]} said: #{params[:comment][:body]}")
      redirect_to project, notice: t('comments.added')
    else
      redirect_to project, alert: t('comments.failed')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :username)
  end

  def project
    @project ||= Project.find_by(id: params[:project_id])
  end
end
