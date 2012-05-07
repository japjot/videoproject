require 'test_helper'

class EmailInvitesControllerTest < ActionController::TestCase
  setup do
    @email_invite = email_invites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_invites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_invite" do
    assert_difference('EmailInvite.count') do
      post :create, email_invite: @email_invite.attributes
    end

    assert_redirected_to email_invite_path(assigns(:email_invite))
  end

  test "should show email_invite" do
    get :show, id: @email_invite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email_invite
    assert_response :success
  end

  test "should update email_invite" do
    put :update, id: @email_invite, email_invite: @email_invite.attributes
    assert_redirected_to email_invite_path(assigns(:email_invite))
  end

  test "should destroy email_invite" do
    assert_difference('EmailInvite.count', -1) do
      delete :destroy, id: @email_invite
    end

    assert_redirected_to email_invites_path
  end
end
