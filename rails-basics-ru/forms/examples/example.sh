bin/rails g simple_form:install

bin/rails g migration add_fields_to_articles published:boolean edited_at:datetime

bin/rails db:migrate

# Установка simple_form с поддержкой bootstrap
rails generate simple_form:install --bootstrap
