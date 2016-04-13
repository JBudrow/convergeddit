class LinksController < ApplicationController
  before_action :authenticate!, except: [:index,:show]

  def index
    @links = Link.all
    render 'index'
  end

  def new
    @link = Link.new
    if logged_in_user
      render 'new'
    else
      flash[:notice] = "login to add post"
      redirect_to root_url
    end
  end

  def show
    @link = Link.find(params['id'])
    render 'show'
  end

  def create
    @link = logged_in_user.links.new(link_params)

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
    if logged_in_user.id == link.user_id
      link.destroy
    else
      flash[:notice] = 'access denied'
    end
    redirect_to root_url
  end

  private

  def link_params
    params.permit(:title, :url)
  end
end
