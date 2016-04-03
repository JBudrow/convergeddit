class UsersController < ApplicationController
  def index
  end

  def show
    # @user = User.find(params['id'])
  end

  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = User.new(name: params['name'],
                     email: params['email'],
                     password: params['password'])
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end
end
 
