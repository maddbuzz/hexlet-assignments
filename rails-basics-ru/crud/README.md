# CRUD

Создайте CRUD для сущности Task и напишите тесты.

## Ссылки

* [CRUD, глаголы и экшены](https://edgeguides.rubyonrails.org/routing.html#crud-verbs-and-actions)
* [Faker](https://github.com/faker-ruby/faker)

## Задачи

У сущности Задача есть следующие поля:

* `name` - обязательное, строка. Название задачи
* `description` - необязательное. Описание задачи
* `status` - обязательное, строка. По умолчанию задача создается в новом статусе
* `creator` - обязательно, строка. Создатель задачи
* `performer` - необязательное, строка. Тот на кого поставлена задача
* `completed` - обязательное булево значение

Сгенерируйте базовый код с помощью команды

  ```bash
  bin/rails generate resource task # Допишите необходимые атрибуты и их типы
  ```

Для генерации задач (в тестах в том числе) используйте Faker

### app/models/task.rb

Добавьте необходимую валидацию в модель.

### app/views/layouts/application.html.erb

Добавьте в навигацию ссылку на список задач.

### app/controllers/tasks_controller.rb

Реализуйте методы CRUD.

Добавьте вывод flash-сообщений.

### app/views/tasks

Создайте шаблоны для просмотра, создания и редактирования задач.

### test/controllers/tasks_controller_test.rb

Напишите тесты для методов CRUD.
