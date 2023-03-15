# Jbuilder

В предыдущем домашнем задании мы научились реализовывать api для сущности пользователь (User). Но подход, который был использован, не давал нужной гибкости при выборе отображаемых полей, поэтому существует более практичный процесс, который называется сериализация. Суть этого метода заключается в том, что мы переводим одну структуру данных или обьект в формат, с которым будем работать. Для этого в rails есть множество пакетов, но мы рассморим два из них: *jbuilder*, который поставляется с rails и *active_model_serializers*.

## Ссылки

* [Jbuilder](https://github.com/rails/jbuilder)
* [ActiveModelSerializers](https://github.com/rails-api/active_model_serializers)

## Реализация API v1 с помощью Jbuilder

## Задачи

### app/controllers/api/v1/users/users_controller.rb

Сгенерируйте контроллер для 1-й версии апи и опишите в нём два обработчика: `index` для получения данных о всех пользователях и `show` для получения данных об одном, конкретном пользователе.

### app/views/api/v1/users/show.json.jbuilder

По аналогии, как указано в примерах документации, создайте шаблон для отображения списка сущности User в JSON формате. Отображаемые поля: `id`, `email`, `address`, `full_name` (состоит из полей `first_name` и `last_name` разделённых пробелом) и `posts`.

### app/views/api/v1/users/_posts.json.jbuilder

Создайте шаблон для отображения сущности Post в JSON формате. Отображаемые поля: `id`, `title`.

### app/views/api/v1/users/index.json.jbuilder

Реализуйте шаблон для отображения списка пользователей.

## Реализация API v2 с помощью ActiveModelSerializers

## Задачи

### Gemfile

Подключите в проект гем `active_model_serializers`.

### app/serializers/user_serializer.rb

[Сгенерируйте сериализатор](https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/general/getting_started.md#creating-a-serializer) для модели User. В свойстве `attributes` перечислите отображаемые поля: `id`, `email`, `address`, `full_name`. Укажите связь один-ко-многим с постами.

### app/serializers/post_serializer.rb

Сгенерируйте сериализатор для модели Post. Отображаемые поля: `id`, `title`.

### app/controllers/api/v2/users/users_controller.rb

Реализуйте контроллер для 2-й версии апи и опишите в нём два обработчика: `index` для получения данных о всех пользователях и `show` для получения данных об одном, конкретном пользователе. Для отображения данных в JSON формате используйте рендеринг с помощью сериализатором, как указано в [документации](https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/general/rendering.md#explicit-serializer)
