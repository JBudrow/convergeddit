class CommentsController < ApplicationController
  def create
    @url = Url.find_by(params['id'])
    @url.comments.create(comment_params)
    redirect_to url_path(@url)
  end

  private

  def comment_params
    params.require(:comments).permit(:body, :user_id)
  end
end
