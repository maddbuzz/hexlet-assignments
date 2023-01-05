# Функциональное программирование

Ruby создавался как удобный объектно-ориентированный язык, но на нем легко писать в функциональном стиле.

В функциональных языках данные неизменяемы. Функции в них принимают аргументы и возвращают результат на основе этих данных без сохранения состояния программы.

## Ссылки

* [map](https://apidock.com/ruby/Enumerable/map)
* [filter](https://apidock.com/ruby/v2_6_3/Enumerable/filter)
* [reduce](https://apidock.com/ruby/v2_6_3/Enumerable/reduce)

## Задачи

### lib/get_same_parity.rb

Напишите функцию `get_same_parity()`, которая принимает на вход список и возвращает новый, состоящий из элементов, у которых такая же четность, как и у первого элемента входного списка.

```ruby
get_same_parity [1, 2, 3, 4, 5, 6] # [1, 3, 5]
get_same_parity [3, 27, 31, 22, 1] # [3, 27, 31, 1]
get_same_parity [2, 3, 3, 10, 4, 4, 28] # [2, 10, 4, 4, 28]
```

### lib/anagramm_filter.rb

Анаграммы — это слова, которые состоят из одинаковых букв. Например:

* спаниель — апельсин
* карат — карта — катар
* топор — ропот — отпор

Реализуйте функцию `anagramm_filter()`, которая находит все анаграммы слова. Функция принимает исходное слово и список для проверки (массив), а возвращает массив всех анаграмм. Если в списке слов отсутствуют анаграммы, то возвращается пустой массив.

```ruby
anagramm_filter('abba', %w[aabb abcd bbaa dada]) # ['aabb', 'bbaa']
anagramm_filter('racer', %w[crazer carer racar caers racer]) # ['carer', 'racer']
anagramm_filter('laser', %w[lazing lazy lacer]) # []
```

### lib/count_by_years.rb

Реализуйте функцию `count_by_years()`, которая принимает список пользователей и возвращает хеш, где ключ - это год рождения (в виде строки), а значение - это количество мужчин, родившихся в этот год.

```ruby
users = [
  { name: 'Bronn', gender: 'male', birthday: '1973-03-23' },
  { name: 'Reigar', gender: 'male', birthday: '1973-11-03' },
  { name: 'Eiegon', gender: 'male', birthday: '1963-11-03' },
  { name: 'Sansa', gender: 'female', birthday: '2012-11-03' },
  { name: 'Jon', gender: 'male', birthday: '1980-11-03' },
  { name: 'Robb', gender: 'male', birthday: '1980-05-14' },
  { name: 'Tisha', gender: 'female', birthday: '2012-11-03' },
  { name: 'Rick', gender: 'male', birthday: '2012-11-03' },
  { name: 'Joffrey', gender: 'male', birthday: '1999-11-03' },
  { name: 'Edd', gender: 'male', birthday: '1973-11-03' },
]

count_by_years(users);
# {
#    '1973' => 3,
#    '1963' => 1,
#    '1980' => 2,
#    '2012' => 1,
#    '1999' => 1,
#  }
```

### Подсказки

В некоторых ситуациях использование `reduce()` лучше заменить на метод `each_with_object()`, который работает похоже, но не требует возврата аккумулятора. В таком случае кода получается меньше, и он чуть проще.
