class CommentsController < ApplicationController
  def create
    @link = Link.find_by(params['id'])
    @link.comments.create(comment_params)
    redirect_to link_path(@link)
  end

  private

  def comment_params
    params.require(:comments).permit(:body, :user_id)
  end
end
