class CommentsController < ApplicationController
  def create
    @link = Link.find(params['id'])
    @link.comments.create(body: params['body'],
                          user_id: logged_in_user.id)
    redirect_to link(@link)
  end
end
