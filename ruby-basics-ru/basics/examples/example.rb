# frozen_string_literal: true

# *******************************************
### Первая команда ###
print 'Hello world!'
print('Hello world!')

# *******************************************
### Использование переменных ###
## Базовое присвоение
greeting = 'Hello world!'
print greeting

# *******************************************
### Арифметика ###
## Работает ли ruby с числами?
print 1 + 1

## Сложение
a = 1 + 2
a += 1 # a = a + 1

## Вычитание
a = 2 - 1
a -= 1 # a = a - 1

## Умножение
a = 2 - 1
a *= 1 # a = a * 1

## Деление
a = 4 / 2
a /= 2 # a = a / 2

## Деление с остатком
a = 5 % 2
a %= 2 # a = a % 2

## Возведение в степень
a = 2**2
a **= 2 # a = a ** 2

## Нюанс
a = 5 / 2 # Integer / Integer = Integer
b = 5.to_f / 2 # Float / Integer = Float

# *******************************************
### Строки на примере `Hello World` ###
## Сложение строк(Конкатенация)
print 'Hello' + ' ' + 'World!'

## Использование переменных в строках(Интерполяция)
world = 'World'
# Двойные ковычки
print "Hello #{world}!"
# Одинарные ковычки
print 'Hello #{world}!' # не тот результат

## Строение. Индексы
# Обращение по индексу
greeting = 'Hello World!'
greeting[0]
# Обращение по интервалу
greeting[1..5]
# Обращение через регулярные выражения
greeting[/Hello/]

# *******************************************
### Логика ###
## Оператор &&
true && false #false

## Оператор ||
true || false #true
# Присвоение через ||
greeting ||= 'Hello world!' # greeting = greeting || 'Hello world!'
print greeting

## Оператор ==
1 == 0 #false

## Оператор !=
1 != 0 #true

# *******************************************
### Все пройденное - объекты ###
## Вопрос к аудитории
'Hello World'.is_a? Object
5.is_a? Object
true.is_a? Object
nil.is_a? Object

## Ответы
# Строки
'Hello World'.class
'Hello World'.class.ancestors
# Числа
5.class
5.class.ancestors
# Булеаны
true.class
true.class.ancestors
# nil
nil.class
nil.class.ancestors

## Строки. Предикаты
'hello'.empty? #false
''.empty? #true
''.nil? #false
a = 'hello'
a.upcase
print a
a = 'hello'
a.upcase!
print a
'hello'.size
'hello'.length

## Числа. Предикаты
0.nil?
0.zero?
1.zero?
2.positive?
2.negative?
8.even?
8.odd?

# *******************************************
### Функции ###
## Примитивная функция
# def - служебное слово для определения функции
def show_greeting
  # слово return не нужно
  print 'Hello World!'
# end - служебное слово для завершения функции
end

## Функция с аргументами
# def show_greeting a
def show_greeting(name)
  # return "Hello, #{name}"
  "Hello, #{name}!"
end

## Функция с необязательными аргументами
def show_greeting(name = 'Alice')
  "Hello, #{name}!"
end

## Функция с именованными аргументами
def show_greeting(name:)
  "Hello, #{name}!"
end

## Функция с именованными необязательными аргументами
def show_greeting(name: 'Alice')
  "Hello, #{name}!"
end

## Пунктуация для функций. Знаки ?, !, =
# Для функций, возвращающих булево значение
def green?(color)
  color == 'green'
end
# Для функций, присваивающих значение(сеттеров)
def make_green=(color)
  color = 'green'
end
# Для функций, меняющих переданный объект
def format_string!(string)
  string.upcase!
end

# *******************************************
### Конструкции ###
## if/elsif/else
a = 1

if a.positive?
  print 'positive'
elsif a.negative?
  print 'negative'
elsif a.zero?
  print 'zero'
else
  print 'unknown'
end

## unless/elsif/else
#unless  == !if
unless 1 == 5
  print 'not equal'
else
  print 'equal'
end

## Guard Clause
#return if true
return if 0.zero?
#return unless true
return unless 0.zero?

## Тернарный оператор
1 == 1 ? print 'equal' : print 'not equal'

## Присвоение выражения переменной
a = 1
greeting = if a.positive?
             'hello'
           else
             'hi'
           end

## Цикл while и until
counter = 1
# do можно опустить
while counter < 5 do
  counter += 1
  print counter
end
print counter
counter = 10
# do можно опустить
until counter > 5 do
  counter += 1
  print counter
end
print counter

## Цикл for
array = [1, 2, 3, 4, 5]
for number in array do
  print "#{number}, "
end

## break
# вернет nil
counter = 1
loop do
  counter += 1
  break if counter == 5
end

# вернет counter
counter = 1
loop do
  counter += 1
  break counter if counter == 5
end

## case
color = 'red'
case color
when 'green'
  print 'Зеленый'
when 'red'
  print 'Красный'
else
  print 'Другой'
end
# Краткая форма
case color
when 'green' then print 'Зеленый';
when 'red'   then print 'Красный';
else print 'Другой'
end

# *******************************************
### Работа вне командной строки. Модули ###
## solution.rb
# module - служебное слово для определения модуля
module Solution
  def find_average(a, b)
    (a + b) / 2
  end
end

## run.rb
# require - относительно root директории(полный путь)
# require_relative - относительно текущей директории(относительный путь)
require_relative 'solution'
# include - служебное слово для использования методов модуля
include Solution
find_average(5, 11)

## запуск в консоли
ruby run.rb

# *******************************************
### Дополненительно. Сравнение print, puts, p, pp ###
## Сравним функции для вывода в командной строке
# Выводит переданный аргумент в консоль
# Возвращает nil
print 'Hello world!'
# Выводит переданный аргумент в консоль
# Возвращает nil
# Добавляет знак переноса строки к переданному аргументу
puts 'Hello world!'
# Выводит переданный аргумент в консоль, сохраняет тип аргумента
# Возвращает переданный аргумент
# Добавляет знак переноса строки к переданному аргументу
p 'Hello world!'
# Выводит переданный аргумент в консоль, сохраняет тип аргумента
# Возвращает переданный аргумент
# Красиво отображает большие хэши и массивы
hash = {"key1"=>"value1", "key2"=>"value2", "key3"=>"value3", "key4"=>"value4",
        "key5"=>"value5", "key6"=>"value6", "key7"=>"value7", "key8"=>"value8"}
pp hash
