# ООП

Ruby является полностью объектно-ориентированным языком: числа, строки, регулярные выражения, массивы - это все объекты определенных классов. Класс определяет поведение объекта - он содержит все методы, доступные его объектам (инстансам).

Часто возникает ситуация, когда необходимо работать с Url. Необходимо его создавать, добавлять параметры запроса, сравнивать. В Ruby имеется стандартная библиотека по работе с Url, но она не позволяет удобно работать с query string.

В этом упражнении мы создадим абстракцию для работы с Url. Наш метод будет предоставлять другие методы и расширять возможности стандартной библиотеки.

## Ссылки

* [URI](https://ruby-doc.org/stdlib-3.0.1/libdoc/uri/rdoc/URI.html) - встроенный класс для работы с uri.
* [Forwardable](https://ruby-doc.org/stdlib-3.0.1/libdoc/forwardable/rdoc/Forwardable.html) делегирование методов
* [Comparable](https://ruby-doc.org/core-3.0.1/Comparable.html) сравнение

## Задачи

### lib/url.rb

Реализуйте класс для работы с адресами. Класс должен содержать конструктор и методы:

* конструктор — принимает на вход адрес в виде строки
* `scheme()` (Через Forwardable) — возвращает протокол передачи данных (без двоеточия).
* `host()` (Через Forwardable) — возвращает имя хоста.
* `query_params()` — возвращает параметры запроса в виде пар ключ-значение объекта.
* `query_param()` — принимает ключ и дефолтное значение (по-умолчанию оно равно `nil`). Если указанный ключ отсутствует в параметрах запроса, то возвращается дефолтное значение
* `==` (Через Comparable) — принимает объект класса Url и возвращает результат сравнения с текущим объектом — `true` или `false`.

```ruby
yandex_url = Url.new 'http://yandex.ru?key=value&key2=value2'
yandex_url.host # yandex.ru
yandex_url.scheme # http
yandex_url.query_params # { key: 'value', key2: 'value2' }
yandex_url.query_param(:key) # 'value'
yandex_url.query_param(:key2, 'lala') # 'value2'
yandex_url.query_param(:new, 'ehu') # 'ehu'
yandex_url.query_param(:lalala) # nil
yandex_url.query_param(:lalala, 'default') # 'default'

google_url = Url.new 'https://google.com:80?a=b&c=d&lala=value'

yandex_url == google_url # false
```
