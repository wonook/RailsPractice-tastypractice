require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get signup_done" do
    get :signup_done
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get login_done" do
    get :login_done
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
