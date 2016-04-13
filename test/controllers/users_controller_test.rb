require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, {name: 'ntyson',
                     email: 'ntyson@domain.com',
                     password: 'ntyson'}
    end
    assert_redirected_to root_path
  end

  test 'should not create user with invalid information' do
     post :create, {name: '',
                    email: 'noname.com',
                    password: '3'}
     assert_template :new
  end
end
