class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in_user

  def logged_in_user
    user_id = session['user_id']
    if user_id
      User.find_by(id: user_id)
    end
  end

  def authenticate!
    unless logged_in_user
      flash[:notice] = "must be logged in"
      redirect_to root_url
    end
  end
end
