# Nested resources

## Ссылки

* [Nested Resources routing](https://guides.rubyonrails.org/routing.html#nested-resources)
* [The Types of Associations](https://guides.rubyonrails.org/association_basics.html#the-types-of-associations)
* Метод [scope](https://api.rubyonrails.org/v6.1.4/classes/ActionDispatch/Routing/Mapper/Scoping.html#method-i-scope)

## Задачи

### CRUD

Создайте CRUD для комментариев поста (модель `PostComment`). Комментарии отображаются списком на странице просмотра поста. У каждого комментария есть ссылка для редактирования и для удаления (с подтверждением). Отдельных страниц просмотра комментариев списком нет.

### app/controllers/posts/comments_controller.rb

Создайте контроллер и опишите необходимые экшены.

### app/models/post_comment.rb

Добавьте в модель `PostComment` связь с моделью `Post` и валидацию (комментарий не может быть пустым).

### app/models/post.rb

Добавьте в модель Post связь с комментариями.

### config/routes.rb

Напишите ресурсные роуты для поста и для вложенного ресурса комментария.

### app/views/posts/show.html.slim

Добавьте на страницу просмотра поста список, созданных для этого поста, комментариев и форму создания комментария. У каждого комментария есть ссылка для редактирования и удаления. При нажатии на ссылку удаления появляется подтверждение.

### test/controllers/posts/comments_controller_test.rb

Напишите тесты на реализованные экшены CRUD для комментариев поста.

### Подсказки

* Иерархию моделей и контроллеров можно подглядеть в [hexlet-cv](https://github.com/Hexlet/hexlet-cv)
