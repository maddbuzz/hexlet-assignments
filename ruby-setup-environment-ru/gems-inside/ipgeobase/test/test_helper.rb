# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

# Previous content of test helper now starts here

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'ipgeobase'

require 'bundler/setup'
Bundler.require

require 'minitest/autorun'
require 'webmock/minitest'

class TestCase < MiniTest::Test
  def load_fixture(filename)
    File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
  end
end
