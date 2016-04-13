require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'should destroy users session' do
    delete :destroy
    assert_redirected_to root_path
    assert_nil session[:user_id]
  end
end
