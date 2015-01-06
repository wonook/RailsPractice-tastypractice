require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get show_all" do
    get :show_all
    assert_response :success
  end

  test "should get show_by_category" do
    get :show_by_category
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get write" do
    get :write
    assert_response :success
  end

  test "should get write_done" do
    get :write_done
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get edit_done" do
    get :edit_done
    assert_response :success
  end

  test "should get delete_done" do
    get :delete_done
    assert_response :success
  end

end
