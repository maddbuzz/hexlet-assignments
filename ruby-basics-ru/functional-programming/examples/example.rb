# frozen_string_literal: true

# # *******************************************
# ### Методы ###
# Метод — функция, принадлежащая объекту
def printer
  print "Hey!"
end

# Функция say_hey определена внутри метода printer, но не вызывается из него
# Чтобы принудительно вызвать say_hey, нам нужно обратиться к ней через printer
def printer
  def say_hey
    print "Hey!"
  end
end

# Метод printer в этом случае ведет себя как объект с методом say_hey.
printer.say_hey

# # *******************************************
# ### Блоки ###
# Пример из прошлого урока
array = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']

# Блок задается со слова do и заканчивается словом end
array.each do |letter|
  puts letter
end

# Блок задается знаками {}
array.delete_if { |letter| letter == 'd' }

# Попробуем распечатать каждый элемент массива в консоль
array_of_numbers = [1, 2, 3, 4, 5]

array_of_numbers.each do |i|
  puts i
end

array_of_numbers.each { |i| puts i }

# Попробуем разложить слово на буквы
company_name = 'hexlet'

company_name.each_char do |char|
  puts char
end

company_name.each_char { |char| puts char }

# Как это работает?
# Блок — функци, которая работает как замыкание, а значит внутри него можно использовать любые переменные,
# определенные снаружи и внутри блока

# yield - (англ. «уступить»)
def method_with_block
  puts "Начинаем выполнять method_with_block"
  yield
  puts "Продолжаем выполнять method_with_block"
end

method_with_block { puts "Выполняем блок, переданный в method_with_block" }
#=> "Начинаем выполнять method_with_block"
#=> "Выполняем блок, переданный в method_with_block"
#=> "Продолжаем выполнять method_with_block"


# yield с аргументами
def method_with_block
  # Передаваемые в yield атрибуты соответствуют переменным в списке, ограниченным вертикальными чертами
  yield 5
  puts "Продолжаем выполнять my_method"
end

method_with_block { |count| puts "Выполняем блок с count равным #{count}" }
#=> "Выполняем блок с count равным 5"
#=> "Продолжаем выполнять my_method"

# Вызов метода с yield без блока
def method_with_block
  yield
  puts "Привет из метода"
end

method_with_block
# `method_with_block': no block given (yield) (LocalJumpError)

# block_given?
def method_with_block
  yield if block_given?
  puts "Привет из метода"
end

method_with_block
#=> "Привет из метода"

# Вернемся к примеру
company_name = 'hexlet'

company_name.each_char do |char|
  puts char
end

company_name.each_char { |char| puts char }

# Одинаковы ли вызовы выше? У {} приоритет выше, чем у do/end

def say_hey(&block)
  yield if block_given?
end

def printer(greeting, &block)
  greeting
  puts 'John!'
end

# Здесь блок будет относиться к функции printer
printer say_hey do
  puts 'Hey!'
end
# => "John!"

# Здесь блок будет относиться к функции say_hey
printer say_hey { puts 'Hey!' }
# => "Hey!"
# => "John!"

# Считайте, что блоки предоставляют нашему методу некий API
# с помощью которго мы можем менять поведение метода, не изменяя его

# Давайте создадим метод с помощью которого мы можем изменять элементы в массиве
# Прямолинейный путь
class Array
  def increase!(number)
    self.each_with_index do |n, i|
      self[i] = n + number
    end
  end
end

array = [1, 2, 3, 4]

array.increase!(1)
# Сколько таких методов надо написать?

# Используя блоки
class Array
  def iterate!
    self.each_with_index do |n, i|
      self[i] = yield(n)
    end
  end
end

array = [1, 2, 3, 4]

array.iterate! { |n| n + 1 }
array.iterate! { |n| n ** 2 }

# # *******************************************
# ### Proc ###
# А что если я захочу передавать не блок а аргумент и чтобы работало также?
# В руби для таких целей существует класс Proc, у которого есть метод call,
# позволяющий вызвать исполнение кода переданное в объект

class Array
  def iterate!(function)
    self.each_with_index do |n, i|
      self[i] = function.call(n) # либо .() .[] .===
    end
  end
end

proc_object = Proc.new do |n|
  n + 1
end

array = [1, 2, 3, 4]

array.iterate!(proc_object)

# Попробуем передать блок
array.iterate! { |n| n + 1 }

# Напишем тот же самый метод иным способом
class Array
  def iterate!(&function)
    self.each_with_index do |n, i|
      self[i] = function.call(n)
    end
  end
end

array = [1, 2, 3, 4]

array.iterate! { |n| n + 1 }

# А как мы получили рабочий код? Что такое &function?
proc_object = Proc.new {} # либо proc {}

def what_am_i(function, &block)
  puts function.class
  puts block.class
end

what_am_i(proc_object) {}

# &function == Proc.new(function)
# блок -- это просто объект класса Proc!

# Почему бы не использовать только блоки?
# Блоками мы не можем передать два или более замыкания в метод
def callbacks(functions)
  functions[:starting].call
  functions[:finishing].call
end

callbacks(
  starting: Proc.new { puts 'Начинаю' },
  finishing: Proc.new { puts 'Заканчиваю' },
)

# Когда вы должны использовать блоки вместо Proc?
# 1. Метод делит объект на мелкие кусочки с ними надо оперировать
# 2. Вы хотите автоматически прогнать несколько операций, например,
# миграции(инструмент для применения измнения к базе данных)

# Когда вы должны использовать Proc вместо блоков?
# 1. Ваш метод будет иметь один или боле замыканий.

# # *******************************************
# ### Лямбды ###
# в Ruby лямбды - отдельный метод объекта Proc

#  Способы задания
lambda_object = lambda do |n|
  n + 1
end

lambda_object = lambda { |n| n + 1 }

lambda_object = -> (n) { n + 1 }

# лямбды работают схоже с Proc, убедимся в этом:
class Array
  def iterate!(code)
    self.each_with_index do |n, i|
      self[i] = code.(n)
    end
  end
end

array = [1, 2, 3, 4]

array.iterate!(lambda { |n| n + 1 })

# Отличие 1. Лямбды проверяют количество переданных аргументов
def arguments(function)
  one, two = 1, 2
  function.call(one, two)
end

arguments(proc { |a, b, c| puts "Я хочу получить аругменты #{a} и #{b} и класс аргумента #{c.class}" })
arguments(lambda { |a, b, c| puts "Я хочу получить аругменты #{a} и #{b} и класс аргумента #{c.class}" })

# Отличие 2. слово return работает по-разному
def proc_return
  puts proc { return 'Метод показал эту запись' }.call

  return 'Метод доработал до конца и вернул эту запись'
end

def lambda_return
  puts lambda { return 'Метод показал эту запись' }.call

  return 'Метод доработал до конца и вернул эту запись'
end

puts proc_return
puts lambda_return

# Когда стоит использовать lambda?
def generic_return(code)
  one, two = 1, 2
  three, four = code.call(one, two)
  return "Give me a #{three} and a #{four}"
end

puts generic_return(lambda { |x, y| return x + 2, y + 2 })
puts generic_return(proc { |x, y| return x + 2, y + 2 })
puts generic_return(proc { |x, y| x + 2; y + 2 })
puts generic_return(proc { |x, y| [x + 2, y + 2] })

# Когда вы должны использовать lambda вместо Proc?
# 1. Если вам больше нравится посылать методу другой метод, который может вернуть метод

# Но если lambda - метод объекта Proc, можем ли мы передавать другие методы и вычислять их как Proc?
# Зарезервированное слово method
class Array
  def iterate!(function)
    self.each_with_index do |n, i|
      self[i] = function.call(n)
    end
  end
end

def square(n)
  n ** 2
end

array = [1, 2, 3, 4]

array.iterate!(method(:square))

# # *******************************************
# ### Функции высшего порядка ###
# Блок — частный случаи функций
# Методы, принимающие на вход блок являются ФВП

# map
numbers = [1, 2, 3, 4, 5]

result_map = numbers.map { |number| number + 1 }

# each
numbers = [1, 2, 3, 4, 5]

result_each = numbers.each { |number| puts number * number }

# collect
chars = [ 'a', 'b', 'c', 'd' ]

chars.collect { |x| x.upcase }

chars.collect(&:upcase)

chars.collect(:upcase) # `collect': wrong number of arguments (given 1, expected 0) (ArgumentError)

# filter
[1, 2, 3, 4, 5].filter {|num| num.even? }

# select
[1, 2, 3, 4, 5].select {|num| num.even? }

# reject
[1, 2, 3, 4, 5].reject {|num| num.even? }

# inject
(5..10).inject(1) { |product, n| product + n }

# reduce
(5..10).reduce(:+)

(5..10).reduce(1, :+)

# Частичное применение функции
# Процесс фиксации числа создает другую функцию с меньшим количеством аргументов
proc { |x, y, z| x + y + z }
# Так выглядит частичное применение функции, с фиксированным атрибутом z
proc { |x, y| proc { |z| x + y + z } }

# Каррирование
# Разделение функции, принимающей несколько аргументов, на N функций, принимающих один аргумент.
proc { |x, y, z| x + y + z }
# Каррированная функция выглядит так
proc { |x| proc { |y| proc { |z| x + y + z} } }

# # *******************************************
# ### Продвинутая работа с аргументами ###

numbers(1, 2, 3, 4, 5, 6, 7, 8)

def numbers(one, two, three, four, five, six, seven, eight)
end

# Заберет в массив args
def numbers(*args)
  p args.class
  p args
end

numbers(1, 2, 3, 4, 5, 6, 7, 8)

# Присвоит first_number первому аргументу, остальные заберет в массив numbers
def numbers(first_number, *args)
  p first_number
  p args
end

numbers(1, 2, 3, 4, 5, 6, 7, 8)

# Второй элемент необходим
# _ нужно для того, чтобы линтер и члены команды понимали, что первый аргумент не нужен
def numbers(_, b)
  puts b
end

numbers(1, 2)

# Именованные аргументы
def initials(first_name:, last_name:)
  puts first_name, last_name
end

initials(first_name: 'John', last_name: 'Doe')

# Забрать только нужные аргументы
def initials(last_name:, **kwargs)
  p last_name, kwargs
end

initials(first_name: 'John', last_name: 'Doe')

# Передать аргументы и блок
def method_with_args_and_block(*args, **kwargs, &block)
  array_word = args.join(', ')
  hash_word = kwargs.each_with_object('') { |(k,v), str| str << "#{k}:#{v}, " }
  yield array_word, hash_word if block_given?
end

method_with_args_and_block(1, 2, 3, k: 1, b: 2) { |word1, word2| puts word1, word2 }

# Все типы аргументов в метод
def method_with_all_types_of_args(a, b = 1, *c, d: 1, **x)
  p a, b, c, d, x
end

method_with_all_types_of_args('a', 'b', 'c', 'd', 'e', d: 2, x: 1)

# LINKS:

# https://ru.hexlet.io/courses/js-functions-hard-way/lessons/currying/theory_unit
# https://ru.hexlet.io/courses/js-functions-hard-way/lessons/partial-application/theory_unit
# https://ru.hexlet.io/courses/php-functional
# https://medium.com/@mr_asqd/ruby-functional-programming-part1-734593e7d78f
# https://scoutapm.com/blog/how-to-use-lambdas-in-ruby
