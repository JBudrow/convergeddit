require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'should render new' do
    get :new
    assert_template :new
  end

  test 'should create users session' do
    post :create, {email: users(:tycho).email, password: 'space'}
    assert_equal session[:user_id], users(:tycho).id
    assert_redirected_to root_url
  end

  test 'should destroy users session' do
    delete :destroy
    assert_redirected_to root_path
    assert_nil session[:user_id]
  end
end
