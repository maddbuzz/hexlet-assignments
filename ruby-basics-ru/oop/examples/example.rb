# frozen_string_literal: true

### Пример из прошлого урока ###

class MyTest < Minitest::Test
  def setup; end

  def teardown; end

  def test_if_dummy_method_returns_true
    name = 'Bob'
    expected_greeting = 'Hello, Bob!'
    assert(greeting(name) == expected_greeting)
  end
end

### Нвпишем свой класс ###

class Bus
  def initialize(params)
    # переменная с @ - переменная класса
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def print_string
    print "
      Vehicle: #{@type.upcase}\n
      Color: #{@color.upcase}\n
      Doors: #{@doors_number.upcase}\n
      Wheels number: #{@wheels_number.upcase}\n
      Wheels radius: #{@wheels_radius.upcase}\n
    "
  end
end

Bus.new(color: 'red', wheels_radius: 18)

### Доступ к аттрибутам экземпляра класса ###

bus = Bus.new(color: 'red', wheels_radius: 18)
# bus.color  undefined method `color'
bus.color = 'green'

class Bus
  def initialize(params)
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def color
    @color
  end

  def color=(color)
    @color = color
  end

  def print_string
    print "
      Vehicle: #{@type.upcase}\n
      Color: #{@color.upcase}\n
      Doors: #{@doors_number.upcase}\n
      Wheels number: #{@wheels_number.upcase}\n
      Wheels radius: #{@wheels_radius.upcase}\n
    "
  end
end

class Bus
  # Создание методов-геттеров
  attr_reader :color, :doors_number, :type, :wheels_number, :wheels_radius
  # Создание методов-сеттеров
  attr_writer :color, :doors_number, :type, :wheels_number, :wheels_radius

  def initialize(params)
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def print_string
    print "
      Vehicle: #{type.upcase}\n
      Color: #{color.upcase}\n
      Doors: #{doors_number.upcase}\n
      Wheels number: #{wheels_number.upcase}\n
      Wheels radius: #{wheels_radius.upcase}\n
    "
  end
end

bus = Bus.new(color: 'red', wheels_radius: 18)
bus.color
bus.color = 'green'

### Методы класса ###

class Bus
  def self.bus?
    true
  end
end

Bus.bus? #

### Разграничение доступа к методам ###

class Bus
  # Геттеры и сеттеры
  attr_accessor :color, :doors_number, :type, :wheels_number, :wheels_radius

  def initialize(params)
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def print_string
    print bus_string_of(self)
  end

  def bus_string_of(bus)
    bus.bus_string
  end

  protected

  def bus_string
    "
      Vehicle: #{upcase_attribute(type)}\n
      Color: #{upcase_attribute(color)}\n
      Doors: #{upcase_attribute(doors_number)}\n
      Wheels number: #{upcase_attribute(wheels_number)}\n
      Wheels radius: #{upcase_attribute(wheels_radius)}\n
    "
  end

  private

  def upcase_attribute(attribute)
    attribute.to_s.upcase
  end
end

bus = Bus.new(color: 'red', wheels_radius: 18)
bus.print_string
bus.bus_string(bus)
bus.bus_string_of(bus)

### Алиасы ###

class Bus
  attr_accessor :color

  def initialize(params)
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def print_string
    print bus_string_of(self)
  end
  alias to_s print_string

  def bus_string_of(bus)
    bus.bus_string
  end

  protected

  def bus_string
    "
      Vehicle: #{upcase_attribute(@type)}\n
      Color: #{upcase_attribute(@color)}\n
      Doors: #{upcase_attribute(@doors_number)}\n
      Wheels number: #{upcase_attribute(@wheels_number)}\n
      Wheels radius: #{upcase_attribute(@wheels_radius)}\n
    "
  end

  private

  def upcase_attribute(attribute)
    attribute.to_s.upcase
  end
end

bus = Bus.new(color: 'red', wheels_radius: 18)
bus.to_s
bus.to_string

### Наследование ###

class Bus
  attr_accessor :color

  def initialize(params)
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def print_string
    print bus_string_of(self)
  end

  def bus_string_of(bus)
    bus.bus_string
  end

  protected

  def bus_string
    "
      Vehicle: #{upcase_attribute(@type)}\n
      Color: #{upcase_attribute(@color)}\n
      Doors: #{upcase_attribute(@doors_number)}\n
      Wheels number: #{upcase_attribute(@wheels_number)}\n
      Wheels radius: #{upcase_attribute(@wheels_radius)}\n
    "
  end

  private

  def upcase_attribute(attribute)
    attribute.to_s.upcase
  end

  alias to_s print_string
end

class OfficeBus < Bus
  attr_reader :people_place

  def initialize(params)
    super
    @people_place = params[:people_place]
  end

  def has_people_place?
    people_place
  end

  protected

  def bus_string
    "
      Vehicle: #{upcase_attribute(@type)}\n
      People place: #{@people_place ? 'YES' : 'NO'}
      Color: #{upcase_attribute(@color)}\n
      Doors: #{upcase_attribute(@doors_number)}\n
      Wheels number: #{upcase_attribute(@wheels_number)}\n
      Wheels radius: #{upcase_attribute(@wheels_radius)}\n
    "
  end
end

class Bus
end

class OfficeBus < Bus
end

OfficeBus.new(color: 'red', wheels_radius: '18', people_place: true).to_s

### Модули ###

## include ##

module Colorful
  COLORS = {
    black: '#000000',
    red: '#FF0000',
    white: '#FFFFFF',
  }

  def color_code(color)
    COLORS[color.to_sym]
  end
end

class Car
  def car?
    true
  end
end

class User
  # include расширяет экземпляры класса
  # Модуль используется как mixin
  # Перезаписывает методы класса, если есть с таким же именем
  include Colorful
  #...
end

class Bus
  attr_accessor :color

  include Colorful

  def initialize(params)
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def print_string
    print bus_string_of(self)
  end

  def bus_string_of(bus)
    bus.bus_string
  end

  protected

  def bus_string
    "
      Vehicle: #{upcase_attribute(@type)}\n
      Color: #{upcase_attribute(@color)}\n
      Doors: #{upcase_attribute(@doors_number)}\n
      Wheels number: #{upcase_attribute(@wheels_number)}\n
      Wheels radius: #{upcase_attribute(@wheels_radius)}\n
    "
  end

  private

  def upcase_attribute(attribute)
    attribute.to_s.upcase
  end

  alias to_s print_string
end

bus = Bus.new(color: 'red', wheels_radius: '18')
bus.color_code(bus.color)

## extend ##

module Colorful
  def colorized?
    true
  end
end

class Bus
  # extend расширяет класс
  extend Colorful

  #...
end

Bus.colorized?

### Вызовы классов и модулей ###

# Короткая запись - Books::HarryPotter.glasses
module Books
  module HarryPotter
    def glasses
    end
  end

  # Вызывается модуль Books::HarryPotter
  HarryPotter::glasses
  # Вызов метода из модуля HarryPotter (который находится глобально)
  ::HarryPotter::magic
end

module HarryPotter
  def magic
  end
end

### method_missing ###

def method_missing(m, *args, &block)
  #...
end

# Стараемся использовать отдельный файл для каждого класса
# Один модуль - один файл

# ruby run.rb
