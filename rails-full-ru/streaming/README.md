# Streaming

## Ссылки

* [ActionController::Live](https://api.rubyonrails.org/classes/ActionController/Live.html)
* [Apidock — CSV](https://apidock.com/ruby/CSV)
* [MDN — Last-Modified header](https://developer.mozilla.org/ru/docs/Web/HTTP/Headers/Last-Modified)

## Задачи

### app/controllers/web/users_controller.rb

Реализуйте метод `stream_csv()`, который генерирует отчет в CSV *report.csv* с полным списком пользователей. Для отдачи файла используйте `ActionController::Live`, а также правильно установите заголовок `Last-Modified`.

Выполните сиды и сравните скорость скачивания файла в разными способами.
