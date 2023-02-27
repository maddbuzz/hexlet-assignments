# Email

## Ссылки

* [Action Mailer Basics](https://guides.rubyonrails.org/action_mailer_basics.html)
* [Mailtrap.io](https://mailtrap.io/)
* [Rails Tutorial — Account activation](https://www.railstutorial.org/book/account_activation)
* [Что такое Mailtrap, или Как тестировать письма на стадиях разработки и предпродакшена](https://ru.hexlet.io/blog/posts/chto-takoe-mailtrap-ili-kak-testirovat-pisma-na-stadiyah-razrabotki-i-predprodakshena)

## Задачи

Добавьте отправку письма о подтверждении регистрации.

### app/mailers/user_mailer.rb

Добавьте в метод `account_activation()` отправку письма пользователю

### app/views/user_mailer/account_activation.html.slim

Добавьте шаблон письма. Должен получится следующий результат:

```html
  <body>
    <h1>Hello, username!</h1>
    <p>Welcome to our test site. To complete registration follow the link below</p>
    <a href="http://hexlet.test/user/confirm?confirmation_token=el4tluqCGOiQrD_kRvwsIw">Complete registration</a>
  </body>
</html>
```

### app/controllers/users_controller.rb

Добавьте в методе `create()` добавьте отправку письма для активации аккаунта пользователя.

## config/environments/development.rb

Для дев-окружения добавьте в конфиг следующие настройки:

```ruby
config.action_mailer.perform_caching = false
config.action_mailer.delivery_method = :file
config.action_mailer.default_url_options = { host: 'http://localhost:3000' } # имя хоста может отличатьcя, если приложение запущено на другом домене или порте
```

С этими настройками приложение будет сохранять письма в файл, вместо реальной отправки.

## config/environments/production.rb

Добавьте для продакшен окружения

```ruby
config.action_mailer.default_url_options = { host: ENV['APP_HOST'] }
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  user_name: ENV['MAIL_USERNAME'],
  password: ENV['MAIL_PASSWORD'],
  address: ENV['MAIL_HOST'],
  domain: ENV['MAIL_HOST'],
  port: ENV['SMTP_PORT'] || '25',
  authentication: :cram_md5
}
```

## Production

Зарегистрируйтесь в [Mailtrap.io](https://mailtrap.io/) (если вы из РФ, вам необходимо [подключить VPN](https://github.com/Hexlet/hexlet-unblock) и указать другую страну). В *Gemfile* для секции *production* добавьте гем для работы с Postgres `gem 'pg'`, а гем для Sqlite3 перенесите в тестовое и окружение разработки.

Выполните деплой приложения. Укажите переменные окружения, которые используются в *config/environments/production.rb*. Зарегистрируйте пользователя и проверьте, что письмо отправляется и отображается в интерфейсе *Mailtrap*.

## Подсказки

* Используйте файлы локализации, которые уже есть в *config/locales*
