class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
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
