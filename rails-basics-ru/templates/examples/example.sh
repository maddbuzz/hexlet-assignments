

# Gemfile
# https://haml.info/
# gem "haml-rails", "~> 2.0"

# http://slim-lang.com/
# https://github.com/slim-template/slim-rails
# http://rdoc.info/gems/slim/frames
gem 'slim-rails'

# Конвертирование erb в slim шаблоны
erb2slim app/views
# Удалить исходные файлы
erb2slim app/views -d
