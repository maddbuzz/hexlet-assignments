# i18n

## Ссылки

* [Rails guides — i18n](https://guides.rubyonrails.org/i18n.html)
* [i18n-debug](https://github.com/fphilipe/i18n-debug) — гем для вывода в загружаемых переводов в режиме разработки
* [simple_form — I18n](https://github.com/heartcombo/simple_form#i18n)

## Задачи

Подключите гем для работы с переводами и добавьте на страницу метки для русского (ru) и английского (en) языков.

### Gemfile

* Подключите гем `rails-i18n` для осуществления переводов
* Подключите гем `i18n-debug` для отображения в терминале запрошенных переводов при работе в окружении для разработки
* Выполните `make setup` для установки зависимостей, выполнения миграцией и создания тестовых данных

### config/routes.rb

Добавьте в роуты скоуп для локалей. Пример получившихся урлов:

```
http://example.com/ru
http://example.com/en/posts
```

### app/views/layouts/application.html.slim

* Добавьте метку с переводом в заголовок страницы
* Добавьте метку в footer с названием Хекслета и текущим годом.

  * ru - `© Хекслет, 2022`
  * en - `© Hexlet, 2022`

  Файлы локализации создайте самостоятельно в директории *config/locales*

### app/views/layouts/shared/_nav.html.slim

Добавьте в навигацию ссылки на домашнюю страницу и список постов

### app/views/home/index.html.slim

Выведите на странице для локалей следующий текст

* en - Home Page
* ru - Домашняя страница

### app/views/posts/index.html.slim

Добавьте в шаблон метки переводов. Сами метки должны находиться в *config/locales/en.posts.yml* и *config/locales/ru.posts.yml* В разделе `posts.index` У каждого поста выводится текст с количеством комментариев. Для `ru` локали:

* нет комментариев
* 1 комментарий
* 2 комментария
* 10 комментариев

Для `en` локали:

* No comments
* 1 comment
* 2 comments
* 10 comments

В каждой строчке с постом выведите ссылки на просмотр, изменение, удаление (с подтверждением) постов. Тексты ссылок должны быть локализованы

### config/locales/ru.yml

Добавьте метки переводов для ru локали

### app/views/posts/_form.html.slim

Создайте форму с помощью simple_form. У поста есть два атрибута *title* (строка) и *body* (текст). Переводы поместите в следующие файлы

  Атрибуты моделей:

* config/locales/en.activerecord.yml
* config/locales/ru.activerecord.yml

  Переводы для форм (плейсхолдеры):

* config/locales/simple_form.en.yml
* config/locales/simple_form.en.yml

### config/locales/ru.yml

Добавьте недостающие метки переводов, аналогично содержимому *config/locales/en.yml*
