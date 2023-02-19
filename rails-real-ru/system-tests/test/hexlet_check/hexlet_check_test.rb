# frozen_string_literal: true

require 'test_helper'
require_relative '../system/posts_test'

class HexletCheckTest < ActiveSupport::TestCase
  test 'PostsTest exists and has methods' do
    assert defined? PostsTest
    test_methods = PostsTest.new({}).methods.select { |method| method.start_with? 'test_' }
    assert_not_empty test_methods
  end
end
