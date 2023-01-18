# Качество

Автоматизированное тестирование – неотъемлемая часть процесса программирования в профессиональной среде. Тесты — единственный надёжный способ убедиться в работоспособности кода. Они не избавляют от багов, но позволяют держать их количество на приемлемом уровне. Тесты дают уверенность, что изменения в одной части системы, не сломали другие части.

Также нужно не забывать о стиле кода. Хороший стиль кодирования – базовое требование к коду в коммерческой разработке. Это важно, в том числе для упрощения командной разработки. Как правило, в одном проекте работает от нескольких до десятков программистов и крайне важно, чтобы им было легко читать код друг друга не спотыкаясь о неправильное форматирование.

## Ссылки

* [Testing Rails Applications](https://guides.rubyonrails.org/testing.html) - инструкция Rails по тестированию приложений
* [Чек-лист хороших инженерных практик в компаниях](https://guides.hexlet.io/ru/check-list-of-engineering-practices/)
* [Начинаем писать тесты (правильно)](https://ru.hexlet.io/blog/posts/how-to-test-code)
* [rubocop-rails](https://github.com/rubocop/rubocop-rails)

## Задачи

* Добавьте в *Gemfile* гемы `rubocop`:
  ```ruby
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  ```

* В файле *.rubocop.yml* настройте правила, для примера можете использовать [шаблонный проект](https://github.com/hexlet-components/rails-users-list/blob/main/.rubocop.yml)

* Сделайте так, чтобы линтинг проходил без ошибок

* Создайте сущность *Bulletin*, у которой есть следующие поля:

    * `title` - необязательное, строка
    * `body` - необязательное, текст
    * `published` - необязательное, булево значение

### config/routes.rb

Добавьте маршруты для `bulletins`.

### app/controllers/bulletins_controller.rb

Напишите обработчики для экшенов *index*, *show*.

### /app/views/bulletins/index.html.erb

Выведите список всех сущностей.

### app/views/bulletins/show.html.erb

Выведите показ объявления.

### test/fixtures/bulletins.yml

Заполните фикстуры для модели *Bulletin*.

### test/controllers/bulletins_controller_test.rb

Напишите тесты для экшенов *index*, *show*.

### Gemfile

Добавьте гемы `rubocop` и `rubocop-rails`
