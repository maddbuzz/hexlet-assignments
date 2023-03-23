# https://guides.rubyonrails.org/caching_with_rails.html
# https://github.com/rails/actionpack-page_caching

# Gemfile
# Гем отвечает за статическое кеширование страниц
# При первом запросе генерируется статический файл, при следующих запросах отдаётся этот файл
gem "actionpack-page_caching"

# config/environments/development.rb
# В режиме разработки можно включить кеширование командой bin/rails dev:cache
require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
    # Задаём директорию для хранения статических файлов страниц
    config.action_controller.page_cache_directory = Rails.root.join('public', 'cached_pages')
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end
end

class BooksController < ApplicationController
  # создает статический файл, например public/books.html
  cache_page :index

  def index
    @books = Book.all
  end
end

class Book < ApplicationRecord
  # Обновление зависимой сущности приводит к обновлению updated_at у основной, что позволяет инвалидировать кеш
  belongs_to :shop, touch: true
end

# Low level caching
Rails.cache.write('my-cache-key', 123)
Rails.cache.read('my-cache-key') # 123
Rails.cache.read('my-not-written') # nil
# fetch создаёт ключ в кеше, если его не было ранее и возвращает это значение
Rails.cache.fetch('my-cache-key2') { 123 }
Rails.cache.read('my-cache-key2') # 123


class Book < ApplicationRecord
  def cached_books
    Rails.cache.fetch("#{cache_key_with_version}/cached_books", expires_in: 5.seconds) do
      Book.limit(30)
    end
  end
end

Book.last.cached_books
# Список ключей в кеше
Rails.cache.instance_variable_get(:@data).keys

# config/environments/development.rb
require "active_support/core_ext/integer/time"

Rails.application.configure do
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    # Размер кеша
    config.cache_store = :memory_store, { size: 64.megabytes }
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
    config.action_controller.page_cache_directory = Rails.root.join('public', 'cached_pages')
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end
end



# config/environments/development.rb
require "active_support/core_ext/integer/time"

Rails.application.configure do
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    # При подключении гема можем добавить новые параметры
    # https://github.com/mperham/connection_pool
    config.cache_store = :memory_store, { size: 64.megabytes, pool_size: 5, pool_timeout: 5 }
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
    config.action_controller.page_cache_directory = Rails.root.join('public', 'cached_pages')
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end
end

# Хранилища для кеша описаны в документации
# https://guides.rubyonrails.org/caching_with_rails.html#cache-stores
