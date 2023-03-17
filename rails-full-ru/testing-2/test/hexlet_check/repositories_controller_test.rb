# frozen_string_literal: true

require 'test_helper'
require_relative '../controllers/web/repositories_controller_test'

module HexletCheck
  module Web
    class RepositoriesControllerTest < ActionDispatch::IntegrationTest
      setup do
        @test_instance = ::Web::RepositoriesControllerTest.new({})
      end

      test 'Web::RepositoriesControllerTest has create test method' do
        test_methods = select_methods_starts_with(@test_instance, 'test_should_create')
        refute_empty test_methods, 'Cant find method starts with "test_should_create"'
      end
    end
  end
end
