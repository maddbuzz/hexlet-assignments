# frozen_string_literal: true

require_relative 'lib/app'

Rack::Handler::Thin.run App.init, Port: 3000, Host: '0.0.0.0'
