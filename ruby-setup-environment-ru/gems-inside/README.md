# Gems Inside

Как и в большинстве языков программирования, в Ruby можно использовать широкий набор сторонних библиотек. Большая часть из них реализована в форме гема.

Есть сервис [ip-api.com](https://ip-api.com/) который позволяет получать информацию по IP - например, страну, город, координаты.

```bash
$ curl "http://ip-api.com/xml/83.169.216.199"

# <?xml version="1.0" encoding="UTF-8"?>
# <query>
#     <status>success</status>
#     <country>United States</country>
#     <countryCode>US</countryCode>
#     <region>VA</region>
#     <regionName>Virginia</regionName>
#     <city>Ashburn</city>
#     <zip>20149</zip>
#     <lat>39.03</lat>
#     <lon>-77.5</lon>
#     <timezone>America/New_York</timezone>
#     <isp>Google LLC</isp>
#     <org>Google Public DNS</org>
#     <as>AS15169 Google LLC</as>
#     <query>8.8.8.8</query>
# </query>
```

В этом домашнем задании мы реализуем гем, который работает с этим сервисом и запушим его на Github.

## Ipgeobase

Реализуйте гем *Ipgeobase* который возвращает метаданные об IP. Гем содержит метод `lookup('8.8.8.8')`, который принимает IP-адрес и возвращает объект метаданных.

В метаданных содержатся следующие поля:

* `city` - город
* `country` - страна
* `countryCode` - код страны
* `lat` - ширина
* `lon` - долгота

```ruby
ip_meta = Ipgeobase.lookup('8.8.8.8')
ip_meta.city # Ashburn
ip_meta.country # United States
ip_meta.countryCode # US
ip_meta.lat # 39.03
ip_meta.lon # -77.5
```

## Задачи

1. Создайте базовую структуру гема командой:
    ```bash
    bundle gem ipgeobase --test=minitest --ci=github --no-mit --no-coc
    ```

1. В файле *ipgeobase.gemspec* измените содержимое аналогично [sample_gem](https://github.com/hexlet-boilerplates/ruby-gem/blob/master/sample_gem.gemspec). Укажите автором себя и свой репозиторий на Github
1. Реализуйте тесты приложения. Для мока запросов используйте библиотеку [Webmock](https://github.com/bblimke/webmock)
1. Добавьте подсчёт покрытия тестами с помощью гема [simlecov](https://github.com/simplecov-ruby/simplecov)
1. Реализуйте необходимую логику для работы гема
1. Запушьте получившийся гем в репозиторий на Github. Убедитесь, что успешно выполняются проверки линтера и тесты в Github Actions. Добавьте в *README.md* бейдж на Github Action
1. Добавьте ссылку на репозиторий гема в *solution*

## Подсказки

* [sample_gem](https://github.com/hexlet-boilerplates/ruby-gem) - пример настроенного гема
* Для преобразования xml в свойства класса используйте гем [Happymapper](https://github.com/mvz/happymapper)
* Используйте [Adressable](https://github.com/sporkmonger/addressable) для формирования урла запроса
