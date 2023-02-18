# Security

## Ссылки

* [Securing Rails Applications](https://guides.rubyonrails.org/security.html)
* [Collective blog](https://rails-collective-blog-ru.hexlet.app/)
* [nokogiri](https://nokogiri.org/)
* [Документация по CSS селекторам](https://developer.mozilla.org/ru/docs/Web/CSS/CSS_Selectors)

## Задачи

### app/libs/hacker.rb

Напишите скрипт, который обходит CSRF в приложении [Collective Blog](https://rails-collective-blog-ru.hexlet.app/) (эталонный проект 2 модуля) и регистрирует пользователя. Используйте гем [nokogiri](https://nokogiri.org/) для парсинга HTML.

Для выполнение этого задания необходимо выполнить несколько запросов:

* Первый запрос — получение страницы регистрации. Необходимо распарсить CSRF токен и получить куки
* Второй запрос — отправка формы регистрации с учётными данными и токеном.

```bash
bin/rails console # переходим в консоль
Hacker.hack('email@test.io', 'password')
```

### Подсказки

Воспользуйтесь инструментами разработчика, чтобы понять как найти токен, как составить запрос для регистрации пользователя.
