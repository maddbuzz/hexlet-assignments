# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module MiddlewareApp
  class Application < Rails::Application
    config.load_defaults 6.1
    config.middleware.delete ActionDispatch::Session::CookieStore
  end
end
