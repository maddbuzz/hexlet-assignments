rails new rake-app

bin/rails console
bin/rails server
bin/rails generate
bin/rails generate scaffold
bin/rails destroy
bin/rails dbconsole
bin/rails runner 'User.all'


bin/rails g scaffold User name
bin/rails db:migrate
bin/rails db:seed

bin/rails runner 'pp User.first'
bin/rails runner lib/user.rb

# Rails команды могут запускаться через Rake
# Но не все rails команды могут так запускаться
bin/rails about
bin/rake about

bin/rake dbconsole
# Running via Spring preloader in process 240506
# rake aborted!
# Don't know how to build task 'dbconsole' (See the list of available tasks with `rake --tasks`)

bin/rake assets:precompile
bin/rake assets:clobber
bin/rake assets:clean
bin/rails notes
bin/rake stats
bin/rake timezones

bin/rake time:zones:all

bin/rails users:create

# Генерация тасок
bin/rails g task
bin/rails g task manipulate_files create
# Вызов таски с аргументами
bin/rails users:update name=vasya
bin/rails 'users:update[vasya]'
