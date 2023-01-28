# README

Реализуйте в данном задании связи для сущности Задача (Task). У Задачи есть Создатель — модель User и статус (Status). Пример использования

```ruby

status = Status.first
user = User.first

task = Task.new name: "Fix bug", description: "fix bug please"

task.status = status
task.user = user

task.save
```

## Ссылки

* [Active Record Associations](https://guides.rubyonrails.org/association_basics.html)
* [One-to-many (data model)](https://en.wikipedia.org/wiki/One-to-many_(data_model))

## Задачи

### Task

* Создайте несколько статусов для задач, например
  * New
  * In Progress
  * Done
* Создайте несколько пользователей
* Реализуйте CRUD модели *Task*. У модели есть название (name) и описание (description)
* У каждой задачи есть пользователь (user) и статус (status). Создайте эти связи в модели *Task* и добавьте выбор пользователя и статуса в форму
* В вывод списка задач добавьте вывод пользователя и  текущий статус

### app/models/user.rb

Добавьте в модель пользователя связь с задачами.

### app/views/users/show.html.slim

Добавьте список задач на страницу пользователя.
