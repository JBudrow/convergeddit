class CommentsController < ApplicationController
  def create
    @link = Link.find(params['id'])
    @link.comments.create(body: params['body']
    redirect_to root_url
  end
end
