# frozen_string_literal: true

require 'test_helper'
require_relative '../controllers/tasks_controller_test'

class HexletCheckTest < ActiveSupport::TestCase
  test 'TasksControllerTest exists and has methods' do
    assert defined? TasksControllerTest
    test_methods = TasksControllerTest.new({}).methods.select { |method| method.start_with? 'test_' }
    refute_empty test_methods
  end
end
