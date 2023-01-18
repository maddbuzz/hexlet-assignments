# Генерация нового проекта
rails new rails-quality
# Установка новых зависимостей после добавления их в Gemfile
bundle install
# Запуск линтера
bundle exec rubocop
# safe auto correction Автокорректирование стилистики
bundle exec rubocop -a
# При флаге -A может измениться бизнес логика
bundle exec rubocop -A

rails g controller notes index show
rails g model Note title:string description:text
rails db:migrate
rails s
rails c
# в консоли
# Note.delete_all

bundle exec brakeman

rails g integration_test notes_flow

# Запуск тестов
bin/rails test:integration
