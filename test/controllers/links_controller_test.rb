require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  def logged_in(user)
    session[:user_id] = users(user).id
  end

  test "should get new" do
    get :new
    assert_redirected_to root_path
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

  test 'should let signed in users view link form' do
    logged_in(:tycho)
    get :new
    assert_template :new
    assert_response :ok
  end

  test 'should show link' do
    get :show, {id: links(:reddit).id}
    assert_not_nil assigns(:link)
  end
end
