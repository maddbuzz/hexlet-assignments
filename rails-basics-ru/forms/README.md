# README

## Ссылки

* Гем [simple_form](https://github.com/heartcombo/simple_form)
* Гайд - [что такое "менеджер версий"](https://guides.hexlet.io/ru/version-managers/)

## Задачи

Для выполнения этого задания вам необходимо скачать и установить Node.js.

  ```bash
  # NodeJS может также устанавливаться с помощью nvm или asdf
  sudo apt-get install curl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  ```

* Установите гем `simple_form` и инициализируйте конфигурацию
  ```bash
  bin/rails generate simple_form:install --bootstrap
  ```

* Установите зависимости для фронтенда:
  ```bash
    npm install --global yarn
    yarn install
  ```

* Создайте CRUD для сущности Пост (Post) со следующими полями:

  * `title` - строка, заголовок поста
  * `body` - текстовое поле, содержимое поста
  * `summary` - строка, краткое описание
  * `published` - булево значение, статус публикации

* Для создания форм редактирования и обновления используйте `simple_form`
