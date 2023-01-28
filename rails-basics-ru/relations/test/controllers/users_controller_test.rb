# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:three)

    @attrs = {
      name: Faker::Movies::BackToTheFuture.character
    }
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    post users_url, params: { user: @attrs }

    user = User.find_by @attrs

    assert { user }
    assert_redirected_to user_url(user)
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    patch user_url(@user), params: { user: @attrs }

    @user.reload

    assert { @user.name == @attrs[:name] }
    assert_redirected_to user_url(@user)
  end

  test 'should destroy user' do
    delete user_url(@user)

    assert { !User.exists? @user.id }

    assert_redirected_to users_url
  end
end
