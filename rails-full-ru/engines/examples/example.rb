https://github.com/thredded/thredded
https://github.com/spree/spree

# Создаётся изолированный движок
# rails plugin new authoree --mountable
#       create
#       create  README.md
#       create  Rakefile
# Все зависимости для движка указываются в gemspec. Зависимости не указанные в gemspec
#       create  authoree.gemspec
#       create  MIT-LICENSE
#       create  .gitignore
#       create  Gemfile
#          run  git init from "."
#       create  app
#       create  app/controllers/authoree/application_controller.rb
#       create  app/helpers/authoree/application_helper.rb
#       create  app/jobs/authoree/application_job.rb
#       create  app/mailers/authoree/application_mailer.rb
#       create  app/models/authoree/application_record.rb
#       create  app/views/layouts/authoree/application.html.erb
#       create  app/assets/images/authoree
#       create  app/assets/images/authoree/.keep
#       create  config/routes.rb
#       create  lib/authoree.rb
#       create  lib/tasks/authoree_tasks.rake
#       create  lib/authoree/version.rb
#       create  lib/authoree/engine.rb
#       create  app/assets/config/authoree_manifest.js
#       create  app/assets/stylesheets/authoree/application.css
#       create  bin/rails
#       create  test/test_helper.rb
#       create  test/authoree_test.rb
#       append  Rakefile
#       create  test/integration/navigation_test.rb
# стаб рельсового приложения через которое мы можем запускать движок как обычное приложение
#   vendor_app  test/dummy
#       append  /tmp/books/Gemfile


# authoree/lib/authoree/engine.rb
module Authoree
  class Engine < ::Rails::Engine
    # Позволяет изолировать всё внутри движка от основного приложения
    isolate_namespace Authoree
  end
end

# authoree/app/controllers/authoree/application_controller.rb
# Жёстко задаем зависимость, require_dependency позволяет работать автозагрузке
require_dependency 'autoree/application_controller'

class Web::ApplicationController < ApplicationController
end

# authoree/authoree.gemspec

# Перед работой с движком необходимо поправить Gemspec (убрать todo)
require_relative "lib/authoree/version"

Gem::Specification.new do |spec|
  spec.name        = "authoree"
  spec.version     = Authoree::VERSION
  spec.authors     = ["example"]
  spec.email       = ["example@mail.com"]
  spec.homepage    = "http://example.com"
  spec.summary     = "Summary of Authoree."
  spec.description = "Description of Authoree."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata['rubygems_mfa_required'] = true
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"
end

# После создания скаффолда внутри движка
# bin/rails g scaffold user name

# authoree/config/routes.rb#
Authoree::Engine.routes.draw do
  resources :users
end

# authoree/app/models/authoree/user.rb
module Authoree
  class User < ApplicationRecord
  end
end

# authoree/app/controllers/authoree/users_controller.rb
require_dependency "authoree/application_controller"

module Authoree
  class UsersController < ApplicationController
end

# authoree/config/routes.rb#
Authoree::Engine.routes.draw do
  root to: 'usersindex'
  resources :users
end



# config/routes.rb
Rails.application.routes.draw do
  resources :books

  # Sidekiq это тоже движок
  # mount Sidekiq::Web => '/sidekiq'
  mount Authoree::Engine, at: '/users'
end

# Gemfile
gem 'authoree', path: 'authoree'

# Установка миграций из движка
# bin/rails authoree:install:migrations                                               1 ↵
# Copied migration 20211118114102_create_authoree_users.authoree.rb from authoree

# Установка миграций из всех движков
# bin/rails railties:install:migrations

# bin/rails db:migrate


module Authoree
  # Позволяет наследоваться от доступного контроллера в основном приложении
  class ApplicationController < ::ApplicationController
  end
end

# Ссылки на страницы движка создаются с помощью префикса
link_to 'Users', authoree.users_path

# Пример с динамической настройкой движка

# authoree/lib/authoree.rb
require "authoree/version"
require "authoree/engine"

module Authoree
  mattr_accessor :consumer_class

  def self.consumer_class
    @@consumer_class.constantize
  end
end

# config/initializers/authoree.rb
Authoree.consumer_class = 'Book'

# authoree/app/models/authoree/user.rb
module Authoree
  class User < ApplicationRecord
    attr_accessor :book_title

    belongs_to :book, class_name: Authoree.consumer_class
    before_validation :add_book

    private

    def add_book
      self.book = Book.find_or_create_by(title: book_title, shop_id: Shop.last)
    end
  end
end
