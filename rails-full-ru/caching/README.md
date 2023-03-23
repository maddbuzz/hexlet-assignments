# Caching

## Ссылки

* [RailsGuides — Caching with Rails](https://guides.rubyonrails.org/caching_with_rails.html)
* [Action caching for Action Pack](https://github.com/rails/actionpack-action_caching)
* [Caching with Rails — Low-Level Caching](https://guides.rubyonrails.org/caching_with_rails.html#low-level-caching)
* [Caching with Rails — ActiveSupport::Cache::FileStore](https://guides.rubyonrails.org/caching_with_rails.html#activesupport-cache-filestore)
* [Rendering Collections](https://guides.rubyonrails.org/layouts_and_rendering.html#rendering-collections)

## Задачи

Включите кэширование для разработки

```bash
bin/rails dev:cache
```

### Gemfile

Подключите гем для кеширования

```ruby
gem 'actionpack-action_caching'
```

### config/environments/development.rb

Добавьте настройте кеш-хранилище с использованием файловой системы. Установите директорию для кеша *<app_root_dir>/tmp/cache*.

### app/views/web/articles/index.html.slim

Выведите статьи с кешированием частичного рендеринга *app/views/web/articles/_article.html.slim*.

### app/controllers/web/articles_controller.rb

Реализуйте метод показа статьи `show()`. Включите для экшена кеширование.

### app/models/article.rb

Реализуйте метод *last_reading_date()*, который возвращает текущую дату из кеша. Срок хранения - 12 часов.
