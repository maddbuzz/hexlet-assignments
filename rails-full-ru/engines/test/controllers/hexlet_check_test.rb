# frozen_string_literal: true

require 'test_helper'

class HexletCheckTest < ActionDispatch::IntegrationTest
  test 'see engine internal page' do
    get rails_stats_url

    assert_response :success
    assert_select 'h2', 'Application Statistics'
  end
end
