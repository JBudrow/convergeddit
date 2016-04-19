class UrlsController < ApplicationController
  before_action :authenticate!, except: [:index,:show]

  def index
    @urls = Url.all
    render 'index'
  end

  def new
    @url = Url.new
    if logged_in_user
      render 'new'
    else
      flash[:notice] = "login to add post"
      redirect_to root_url
    end
  end

  def show
    @url = Url.find(params['id'])
    render 'show'
  end

  # def create
  #   if !params[:url].blank?
  #     client = Bitly.client
  #     @url = client.shorten(params['url'])
  #     redirect_to root_url
  #   end
  # end

  def create
    url = logged_in_user.urls.new(url_params)
    client = Bitly.client
    address = client.shorten(params['address'])
    if @url.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @url = Url.find(params['id'])
  end

  def update
    url = Url.find(params['id'])
    url.update(title: params['title'])
    redirect_to root_path
  end

  def destroy
    url = Url.find(params['id'])
    if logged_in_user.id == url.user_id
      url.destroy
    else
      flash[:notice] = 'access denied'
    end
    redirect_to root_url
  end

  private

  def url_params
    params.permit(:title, :address)
  end
end
