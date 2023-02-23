# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'new' do
    get new_session_url
    assert_response :success
  end

  test 'create' do
    user = users(:one)

    post session_url, params: { user: { email: user.email, password: 'password' } }

    assert { signed_in? }
    assert_redirected_to user_url(user)
  end

  test 'destroy' do
    sign_in_as(:one)

    delete session_url

    assert { !signed_in? }
    assert_redirected_to root_url
  end
end
