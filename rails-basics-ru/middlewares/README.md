# Middlewares

## Ссылки

* [Rails on Rack — взаимодействие Rails и Rack](https://guides.rubyonrails.org/rails_on_rack.html)
* [Accept-Language](https://developer.mozilla.org/ru/docs/Web/HTTP/Headers/Accept-Language)
* [Получение языка из заголовка](https://guides.rubyonrails.org/i18n.html#inferring-locale-from-the-language-header)
* [Rack::Request](https://rubydoc.info/gems/rack/Rack/Request)

## Задачи

### app/middlewares/set_locale_middleware.rb

Реализуйте миддлвар для определения локали пользователя. Если заголовка нет или он пустой, то используется стандартная локаль в I18n.
