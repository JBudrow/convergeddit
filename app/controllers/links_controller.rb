class LinksController < ApplicationController
  def index
    @links = Link.all
    render 'index'
  end

  def new
    @link = Link.new
    render 'new'
  end

  def create
    @link = logged_in_user.links.new(link_params)
    if @link.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
  def link_params
      params.require(:link).permit(:title, :url)
  end
end
