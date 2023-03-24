# frozen_string_literal: true

require 'test_helper'

module RailsStats
  class StatsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'should get root' do
      get root_path

      assert_response :success
    end
  end
end
