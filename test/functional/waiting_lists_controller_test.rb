require 'test_helper'

class WaitingListsControllerTest < ActionController::TestCase
  setup do
    @waiting_list = waiting_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:waiting_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create waiting_list" do
    assert_difference('WaitingList.count') do
      post :create, waiting_list: @waiting_list.attributes
    end

    assert_redirected_to waiting_list_path(assigns(:waiting_list))
  end

  test "should show waiting_list" do
    get :show, id: @waiting_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @waiting_list
    assert_response :success
  end

  test "should update waiting_list" do
    put :update, id: @waiting_list, waiting_list: @waiting_list.attributes
    assert_redirected_to waiting_list_path(assigns(:waiting_list))
  end

  test "should destroy waiting_list" do
    assert_difference('WaitingList.count', -1) do
      delete :destroy, id: @waiting_list
    end

    assert_redirected_to waiting_lists_path
  end
end
