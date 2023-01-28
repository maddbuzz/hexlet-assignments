# frozen_string_literal: true

require 'test_helper'

class StatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status = statuses(:three)

    @attrs = {
      name: Faker::Movies::PrincessBride.character
    }
  end

  test 'should get index' do
    get statuses_url
    assert_response :success
  end

  test 'should get new' do
    get new_status_url
    assert_response :success
  end

  test 'should create status' do
    post statuses_url, params: { status: @attrs }

    status = Status.find_by @attrs

    assert { status }
    assert_redirected_to status_url(status)
  end

  test 'should show status' do
    get status_url(@status)
    assert_response :success
  end

  test 'should get edit' do
    get edit_status_url(@status)
    assert_response :success
  end

  test 'should update status' do
    patch status_url(@status), params: { status: @attrs }

    @status.reload

    assert { @status.name == @attrs[:name] }
    assert_redirected_to status_url(@status)
  end

  test 'should destroy status' do
    delete status_url(@status)

    assert { !Status.exists? @status.id }

    assert_redirected_to statuses_url
  end
end
