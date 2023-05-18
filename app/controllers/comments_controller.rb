class CommentsController < ApplicationController
  def create
    if @project.nil?
      redirect_to projects_path, alert: t('projects.project_not_found')
      return
    end

    @comment = @project.comments.build(comment_params)

    if @comment.save
      redirect_to @project, notice: t('comments.comment_added')
    else
      redirect_to @project, alert: t('comments.comment_failed')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :username)
  end
end
