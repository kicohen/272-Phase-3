require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_not_nil assigns(:items_to_reorder)
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get privacy" do
    get :privacy
    assert_response :success
  end

  test "should get store" do
    get :store
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
    assert_not_nil assigns(:items_to_reorder)
  end


end