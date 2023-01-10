# Установка гема
gem install rails

# Установить определенную версию библиотеки
gem install rails --version 5.0

# Поиск среди доступных гемов
gem search -r rails

# Для просмотра всех локально установленных гемов:
gem list

# Чтобы получить (очень длинный) список всех гемов, доступных на RubyGems.org:
gem list -r

# Документация
gem help

## Bundler ##

# Инициализация
bundle init

# Установка
bundle install # bundle install --without development test

# Запуск определенных зависимостей
bundle exec rails -v

# Cоздавая gemset, вы создаете новую папку, в которую можно складывать новые gem'ы,
# будучи абсолютно уверенным, что они изолированы от ранее установленных.
gemset

## Создание гема ##

gem install bundler

bundle -v

bundle gem test_gem

gem build

gem install

gem push
