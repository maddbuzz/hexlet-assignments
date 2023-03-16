# frozen_string_literal: true

require 'test_helper'

class Web::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user_params = {
      name: Faker::Name.name,
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

    assert_redirected_to user_url(@user)
    assert { @user_params[:name] == @user.name }
    assert { @user_params[:email] == @user.email }
  end

  test 'can destroy user' do
    delete user_url(@user)

    refute { User.exists? @user.id }
    assert_redirected_to users_url
  end

  test 'should get normalcsv' do
    get normal_csv_users_url(format: :csv)

    assert_response :success
  end

  test 'should get stream csv' do
    get stream_csv_users_url(format: :csv)

    assert_response :success
  end
end
