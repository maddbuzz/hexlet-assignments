# Nested Forms

В данном задании дана форма для создания и редактирования резюме. В форме помимо резюме есть поля с предыдущими местами работы (`ResumeWork`) и образованием (`ResumeEducation`). Для динамического (при нажатии на кнопку, без обновления страницы) изменения формы используется гем [cocoon](https://github.com/nathanvda/cocoon).

Гем cocoon уже подключен и настроен, необходимо только воспользоваться им.

## Ссылки

* [Active Record Nested Attributes](https://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html)
* [The belongs_to Association](https://guides.rubyonrails.org/association_basics.html#the-belongs-to-association)
* [The has_many Association](https://guides.rubyonrails.org/association_basics.html#the-has-many-association)
* [Simple Fields For](https://github.com/heartcombo/simple_form#simple-fields-for)
* [cocoon](https://github.com/nathanvda/cocoon)

## Задачи

### app/models/resume.rb

Добавьте в модель связи с моделями `ResumeEducation` с именем `educations` и `ResumeWork` под именем `works`. Добавьте в модель вложенные атрибуты для созданных связей.

### app/models/resume_education.rb

Добавьте в модель реверсивную связь с резюме.

### app/models/resume_work.rb

Добавьте в модель реверсивную связь с резюме.

### app/views/resumes/_form.html.slim

Добавьте в форму рендер полей для мест учёбы. Добавление мест учёбы должно выполняться через [cocoon](https://github.com/nathanvda/cocoon).

### app/views/resumes/_education_fields.html.slim

Добавьте поля для мест учёбы. Доступные поля можно подглядеть в миграции.
