require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = User.new
    @user.name = "user123"
    @user.password = "pass123"
    @user.password_confirmation = "pass123"
    @user.save
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { name: "username", password: "pass123", password_confirmation: "pass123" }
    end

    assert_redirected_to root_path
  end

  test "should not show user" do
    get :show, id: @user
    assert_redirected_to signin_path
  end

  test "should not destroy user" do
    assert_difference('User.count', 0) do
      delete :destroy, id: @user
    end

    assert_redirected_to signin_path
  end

  test "should not show owned rooms" do
    get :owned_rooms, id: @user
    assert_redirected_to signin_path
  end

  test "should not show my rooms" do
    get :member_rooms, id: @user
    assert_redirected_to signin_path
  end
end
