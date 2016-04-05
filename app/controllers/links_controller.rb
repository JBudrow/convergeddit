class LinksController < ApplicationController
  def index
    @links = Link.all
    render 'index'
  end

  def new
    @link = Link.new
    render 'new'
  end

  def show
    @link = Link.find(params['id'])
    render 'show'
  end

  def create
    @link = logged_in_user.links.new(title: params['title'],
                                     url: params['url'])
    if @link.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @link = Link.find(params['id'])
  end

  def update
    link = Link.find(params['id'])
    link.update(title: params['title'],
                url: params['url'])
    redirect_to root_path
  end

  def destroy
    link = Link.find(params['id'])
    link.destroy
    redirect_to root_url
  end

  # private
  # def link_params
  #   params.require(:link).permit(:title, :url)
  # end
end
