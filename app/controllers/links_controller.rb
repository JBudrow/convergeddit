class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
    render 'new'
  end

  def create
    @link = logged_in_user.links.new(title: params['title'],
                                   url: params['url'])

  end
end
