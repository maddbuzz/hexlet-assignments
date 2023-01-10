# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

# Previous content of test helper now starts here

# $LOAD_PATH.unshift File.expand_path("../lib", __dir__)
# require "ipgeobase"

require 'bundler/setup'
Bundler.require

require 'minitest/autorun'
require 'webmock/minitest'
