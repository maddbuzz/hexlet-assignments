bin/rails g controller articles index
bin/rails g model articles title:string body:text author
bin/rails db:migrate
# https://github.com/ctran/annotate_models
bundle
bin/rails g annotate:install
bundle exec annotate

# https://github.com/faker-ruby/faker
bundle

bin/rails db:seed
bin/rails c
# В консоли
pp Article.all

bin/rails routes -g article
