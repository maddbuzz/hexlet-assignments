# Модели

Модель – это слой приложения, отвечающий за связь с предметной областью. В нём находится вся бизнес-логика приложения. Для простоты реализации, сюда часто включают механизмы для работы с базой данных.

Очень важно понимать, что модель, как слой, существует независимо от фреймворка, HTTP и веба в целом. Вся остальная система может обращаться к моделям, но модели не могут знать и не знают ничего про среду, в которой они выполняются.

Создадим модель статьи и отобразим созданные статьи на веб-странице.

## Ссылки

* [Using a Model to Interact with the Database](https://guides.rubyonrails.org/getting_started.html#using-a-model-to-interact-with-the-database)
* [Active Record Basics](https://guides.rubyonrails.org/active_record_basics.html)

## Задачи

### Rails Console

* Сгенерируйте модель *Article* с атрибутами *title* и *body*

    ```bash
    bin/rails generate model article title body:text
    ```

* Выполните миграцию

    ```bash
    bin/rails db:migrate
    ```

* Добавьте несколько статей через REPL. Консоль вызывается так:

    ```bash
    # Внутри выполняется команда `bin/rails console`
    make console
    ```

### app/controllers/articles_controllers.rb

Создайте контроллер *ArticlesController* с обработчиками *index* и *show*.

### config/routes.rb

Добавьте ресурс статей с маршрутами *index* и *show*.

### app/controllers/articles_controller.rb

Получите из базы все статьи и передайте их в шаблон.

### app/views/articles/index.html.erb

Выведите список статей в шаблоне в виде заголовков. Добавьте ссылку на чтение каждой отдельной статьи.

### app/views/articles/show.html.erb

Выведите показ статьи на странице.
