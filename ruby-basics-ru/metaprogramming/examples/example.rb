# frozen_string_literal: true

## Класс - это объект Class

class Cat
end

Dog = Class.new

Cat.object_id
Dog.object_id

## Поиск метода объекта

class Cat

  def count_legs
    4
  end

end

cat = Cat.new

cat.class
Cat.class

cat.class.ancestors
Cat.class.ancestors

## Метакласс
first_cat = Cat.new
second_cat = Cat.new
def first_cat.meow
  "meow"
end

first_cat.meow

second_cat.meow

first_cat.singleton_class
second_cat.singleton_class

first_cat.singleton_methods
second_cat.singleton_methods

## Include
module Homable
  def has_home?
    true
  end
end

class Cat
  include Homable

  def has_home?
    false
  end
end

Cat.new.has_home?

Cat.ancestors

### Prepend

module Homable
  def has_home?
    true
  end
end

class Cat
  prepend Homable

  def has_home?
    false
  end
end

Cat.new.has_home?

Cat.ancestors

## Extend

module Homable
  def has_home?
    true
  end
end

class Cat
  extend Homable
end

Cat.has_home?

### define_method, instance_variable_get, instance_variable_set

### Добавление метода экземпляру
class Cat

  define_method 'eat' do |food|
    "#{food}'s yammy!"
  end

end

cat = Cat.new
cat.eat 'whiskas'

### Чтение переменной экземпляра
class Cat
  def initialize string
    @color = string
  end
end

cat = Cat.new("black")
cat.instance_variable_get "@color"

### Запись переменной экземпляра
class Cat
end

cat = Cat.new()
cat.instance_variable_set "@color", "black"

### Добавление методов классу
class Cat

  def self.my_attr_accessor *attributes
    attributes.each do |attribute|
      # Getter
      define_method attribute do
        self.instance_variable_get "@#{attribute}"
      end
      ########

      # Setter
      define_method "#{attribute}=" do |value|
        self.instance_variable_set "@#{attribute}", value
      end
      ########
    end
  end

  my_attr_accessor :name, :age, :weight

  def initialize name, age, weight
    @name, @age, @weight = name, age, weight
  end

end

# ### method_missing
# # ~/.rvm/gems/ruby-3.0.1/gems/activerecord-6.1.3.2/lib/active_record/dynamic_matchers.rb
# # ~/.rvm/gems/ruby-3.0.1/gems/activesupport-6.1.3.2/lib/active_support/string_inquirer.rb

class StringInquirer < String
  private
  def method_missing(method_name, *arguments)
    if method_name.to_s.end_with?("?")
      self == method_name[0..-2]
    else
      super
    end
  end
end

mammal = StringInquirer.new('cat')
mammal.cat? # true
mammal.dog? # false

mammal.methods.include? :cat? #false

# Alias, alias_method
# https://bigbinary.com/blog/alias-vs-alias-method

# Delegate
# https://www.youtube.com/c/JesusCastello
# https://www.youtube.com/watch?v=qbAcpubjLJU

# HOMEWORK: hexlet program download rails metaprogramming


class User
  def log_vk_auth
    Loggers::VK.new.send_message
  end

  def log_facebook_auth
    Loggers::Facebook.new.send_message
  end

  def log_twitter_auth
    Loggers::Twitter.new.send_message
  end

  # с использованием active support
  %w(vk facebook twitter).each do |network|
    define_method "log(#{network}_auth" do
      "Loggers::#{network.capitalize}".constantize
    end
  end
end
