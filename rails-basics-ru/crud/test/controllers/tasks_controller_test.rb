# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'opens all tasks page' do
    get tasks_path
    assert_response :success
    assert_select 'h1', 'Tasks'
  end
end
