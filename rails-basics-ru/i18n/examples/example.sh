rails new i18n-app
cd i18n-app
bin/rails g scaffold user first_name last_name
bin/rails g controller welcome index

bin/rails db:migrate
bin/rails s



