class CommentsController < ApplicationController
  def create
    # binding.pry
    @link = Link.find_by(params['id'])
    @link.comments.create(body: params['body'],
                          user_id: logged_in_user.id)
    redirect_to link_path(@link)
  end
end
