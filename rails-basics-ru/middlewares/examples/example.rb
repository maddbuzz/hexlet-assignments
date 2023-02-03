# frozen_string_literal: true

Rails::Server.new.tap do |server|
  require APP_PATH
  Dir.chdir(Rails.application.root)
  server.start
end

class RailsServer < Rack::Server
end

# config/application.rb
module MiddlewareApp
  class Application < Rails::Application
    config.load_defaults 6.1

    # Удаление миддлвары из списка
    config.middleware.delete ActionDispatch::Session::CookieStore
    # Поменять мидлвары местами
    config.middleware.swap ActionDispatch::Flash, ActionDispatch::Cookies
    # Вставка миддлвары в определенном порядке
    config.middleware.insert_before ActionDispatch::Flash, ActionDispatch::Cookies
    config.middleware.insert_after ActionDispatch::Flash, ActionDispatch::Cookies
    # Добавить миддлвар в конец
    config.middleware.use ActionDispatch::Flash

    # В миддлвары можно передавать аргументы. Они будут 2, 3 и тд параметрами
    config.middleware.use RequestTimeLogger, '#'
  end
end

# Метод dup клонирует начальный объект
hash1 = { key: 'value', key2: 'value2' }
hash2 = hash1.dup
hash1.delete :key2
pp hash1 # => {:key=>"value"}
pp hash2 # => {:key=>"value", :key2=>"value2"}
