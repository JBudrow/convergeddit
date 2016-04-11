class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    @user = User.find_by(email: params['email'])
    if @user && @user.authenticate(params['password'])
      session[:user_id] = @user.id
      flash[:notice] = 'Logged in.'
      redirect_to root_url
    else
      flash['notice'] = 'No matches found.'
      render 'new'
    end
  end

  def destroy
    # session[:logged_in_user] = nil
    session[:user_id] = nil
    redirect_to root_url
  end
end
