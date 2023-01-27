# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)

    @attrs = {
      name: Faker::Artist.name,
      description: Faker::Movies::HarryPotter.quote,
      status: Faker::Movies::HarryPotter.spell,
      creator: Faker::Movies::HarryPotter.character,
      performer: Faker::Movies::HarryPotter.character,
      completed: Faker::Boolean.boolean
    }
  end

  test 'should get index' do
    get tasks_url
    assert_response :success
  end

  test 'should get new' do
    get new_task_url
    assert_response :success
  end

  test 'should create task' do
    post tasks_url, params: { task: @attrs }

    task = Task.find_by @attrs

    assert { task }
    assert_redirected_to task_url(task)
  end

  test 'should show task' do
    get task_url(@task)
    assert_response :success
  end

  test 'should get edit' do
    get edit_task_url(@task)
    assert_response :success
  end

  test 'should update task' do
    patch task_url(@task), params: { task: @attrs }

    @task.reload

    assert { @task.name == @attrs[:name] }
    assert_redirected_to task_url(@task)
  end

  test 'should destroy task' do
    delete task_url(@task)

    assert_redirected_to tasks_url

    assert { !Task.exists? @task.id }
  end
end
