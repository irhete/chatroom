require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = User.new
    @user.name = "user123"
    @user.password = "pass123"
    @user.password_confirmation = "pass123"
    @user.save
  end

  test "login with valid credentials" do
    post :create, session: {name: @user.name, password: @user.password}
    assert session[:current_user_id] == @user.id
    assert_redirected_to user_path(@user)
  end

  test "login with invalid credentials" do
    post :create, session: {name: @user.name, password: "wrongpass"}
    assert session[:current_user_id] == nil
    assert flash[:error], 'Invalid email/password combination'
  end

  test "logout" do
    post :create, session: {name: @user.name, password: @user.password}
    delete :destroy, id: @user
    assert session[:current_user_id] == nil
    assert_redirected_to root_url
  end

end
