# Статические страницы

Хотя фреймворк Ruby On Rails разработан для создания динамических веб-сайтов, он также отлично справляется с созданием статических страниц.

Создадим домашнюю страницу и "Обо мне", которые будут доступны по путям */* и */pages/about* соответственно.

## Ссылки

* [Routing](https://guides.rubyonrails.org/routing.html)
* [Layouts and Rendering](https://guides.rubyonrails.org/layouts_and_rendering.html)

## Подготовка к домашним работам

Для работы с домашними работами по Rails вам необходимо будет установить также установить NodeJS и Yarn

  ```bash
  # NodeJS может также устанавливаться с помощью nvm или asdf
  sudo apt-get install curl
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  sudo apt install -y nodejs

  npm install --global yarn
  yarn install
  ```

## Задачи

### app/controllers/home_controller.rb

Сгенерируйте контроллер и экшен *index*.

```bash
bin/rails generate controller HomeController index --skip-routes --skip
```

### app/controllers/pages_controller.rb

Сгенерируйте контроллер и метод *show* командой:

```bash
bin/rails generate controller Pages show --skip-routes
```

### config/routes.rb

* Укажите корневую страницу на метод *index* контроллера *HomeController*.
* Добавьте ресурс *pages* с одним методом *show*.

### app/views/home/index.html.erb

Выведите на странице ссылку на страницу "Обо мне", используя хелпер.

### app/views/pages/show.html.erb

Добавьте на страницу рендеринг шаблона, который берется по *id* текущей страницы.

### app/views/pages/_about.html.erb

Создайте файл шаблона. Выведите ссылку на домашнюю страницу. Добавьте информацию о себе. Должна получиться следующая структура страницы:

```html
<ul>
  <li><a href="/">Home</a></li>
</ul>

<main>
    <h1>Илона Маскова</h1>
    <h2>Будущая Rails-звезда! </h2>
    <hr>
    <section>
        <h2>Ключевые навыки:</h2>
        <ul>
            <li>Ruby On Rails</li>
            <li>Ruby</li>
            <li>JavaScript</li>
        </ul>
    </section>
    <section>
        <h2>О Обо мне</h2>
        <p>...</p>
    </section>
</main>
```
