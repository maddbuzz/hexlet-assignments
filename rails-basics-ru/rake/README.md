# Rake

## Ссылки

* [Rails Guides — The Rails Command Line](https://guides.rubyonrails.org/command_line.html)
* [How to generate rake task](https://railsguides.net/how-to-generate-rake-task/)
* [CSV](https://apidock.com/ruby/CSV) — класс для работы с csv

## Задачи

Создайте Rake задачу по загрузке списка пользователей из CSV-файла. Сам файл находится в *test/fixtures/files/users.csv*. Пример использования команды:

```bash
bin/rails hexlet:import_users[test/fixtures/files/users.csv]
```

Проверьте, что пользователи загружены в БД

```bash
# Заходим в консоль
bin/rails console
# Количество пользователей в БД
irb(main):002:0> User.count
   (1.1ms)  SELECT COUNT(*) FROM "users"
=> 100
```
