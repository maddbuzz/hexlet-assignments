# frozen_string_literal: true

require 'test_helper'

class Web::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user_params = {
      first_name: Faker::TvShows::Friends.character,
      email: Faker::Internet.email
    }
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'can create user' do
    post users_url, params: { user: @user_params }

    user = User.find_by @user_params

    assert { user }
    assert_redirected_to user_url(user)
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'can edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'can update user' do
    patch user_url(@user), params: { user: @user_params }

    @user.reload

    assert { @user_params[:first_name] == @user.first_name }
    assert_redirected_to user_url(@user)
  end

  test 'can destroy user' do
    delete user_url(@user)

    assert { !User.exists? @user.id }
    assert_redirected_to users_url
  end
end
