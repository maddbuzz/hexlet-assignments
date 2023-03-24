# frozen_string_literal: true

require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  test 'it has a version number' do
    assert Blog::VERSION
  end
end
