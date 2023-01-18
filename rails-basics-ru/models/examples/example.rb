# Create App
# rails new example_app --minimal --api --skip-git
cd example_app
# Prepare DB
# bin/rails db:create
# bin/rails g model User first_name last_name role is_active:boolean
# bin/rails db:migrate

# Gemfile
gem 'faker'

# bundle install

# db/seeds.rb
User.create(first_name: 'John', last_name: 'Doe', role: 'admin')
User.create(first_name: 'John', last_name: 'Smith', role: 'customer')

100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: %w[customer admin superuser].sample,
    is_active: [true, false].sample
  )
end

# bin/rails db:seed

# Console
# bin/rails c

User.count
User.first
User.last
user = User.find_by(fist_name: 'John')
users = User.where(fist_name: 'John')
user.class
users.class

user.update(first_name: 'Ivan')
user.destroy
User.destroy_all

# Migrations
# bin/rails g migration add_attributes_to_user age:integer email:string
# bin/rails db:migrate
# bin/rails db:rollback

# Validation
user = User.new
user.valid? # false
user.errors # <ActiveModel::Errors
user.errors.messages
# {:first_name=>["can't be blank"], :role=>["is not included in the list"], :age=>["is not a number"], :email=>["has already been taken", "is invalid"]}
user.errors.full_messages
# ["First name can't be blank",
#   "Role is not included in the list",
#   "Age is not a number",
#   "Email has already been taken",
#   "Email is invalid"]

user = User.new(first_name: 'John', last_name: 'Doe', role: 'customer', age: 25, email: 'johndoe@email.com')
user = User.new(first_name: 'Ivan', last_name: 'Doe', role: 'customer', age: 25, email: 'johndoe@email.com')

user.update_column(:first_name, 'John')

# Default attributes

attribute :is_active, :boolean, default: -> { false }

# db/seeds.rb

100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker:: Internet.email,
    age: (18..100).to_a.sample,
    role: %w( customer admin superuser ).sample,
    is_active: [true, false].sample
  )
end

# bin/rails db:reset

# Scopes

scope :customers, -> { where(role: 'customer') }
scope :admins, -> { where(role: 'admin') }
scope :superusers, -> { where(role: 'superuser') }
scope :old_admins, -> { admins.where('age > ?', 60) }
scope :admins_older_than, -> (age) { admins.where('age > ?', age) }

default_scope { admins }

User.all.count # 32
User.unscoped.all.count # 100

# Query

User.where.not(role: :admin)
User.where(role: :admin).or(User.where(role: :superuser))
User.order(:age)
User.order(age: :desc)
User.select(:first_name, :last_name)
User.select(:last_name).distinct
User.limit(15)
User.limit(15).offset(30)
User.group(:age).count
User.none
User.customers.where("age > ?", 45).select(:email)
