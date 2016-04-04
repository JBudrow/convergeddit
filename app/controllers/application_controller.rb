class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in_user

  def logged_in_user
    user_id = session['user_id']
    if user_id
      User.find_by(id: user_id)
    end
  end
end
