# Search forms

## Ссылки

* [Ransack](https://github.com/activerecord-hackery/ransack)
* [Ransack — Search Matchers](https://activerecord-hackery.github.io/ransack/getting-started/search-matches/)
* [hexlet-cv](https://github.com/Hexlet/hexlet-cv)

## Задачи

### Gemfile

Подключите в *Gemfile* гем `ransack`

```ruby
gem 'ransack'
```

### config/application.rb

Добавьте обработчик SimpleForm для Ransack

```ruby
ENV['RANSACK_FORM_BUILDER'] = '::SimpleForm::FormBuilder'
```

### app/controllers/posts_controller.rb

Выведите список постов с помощью фильтра ransack.

### app/views/posts/index.html.slim

Добавьте поисковую форму на страницу со списком постов. Поиск может осуществляться по названию (по вхождению) и по состоянию (`draft`, `published`)
