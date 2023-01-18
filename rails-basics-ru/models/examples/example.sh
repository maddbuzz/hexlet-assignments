# Create App
rails new example_app --minimal --api --skip-git
cd example_app
# Prepare DB
bin/rails db:create
# Create model
bin/rails g model User first_name last_name role is_active:boolean
bin/rails db:migrate

# Сидирование БД
bin/rails db:seed

# Console
bin/rails c

# Sandbox
bin/rails c --sandbox

# Migrations
bin/rails g migration add_attributes_to_user age:integer email:string
bin/rails db:migrate
bin/rails db:rollback
bin/rails db:reset
