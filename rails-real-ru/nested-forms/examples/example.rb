# form_for @user do |f|
#   вложенная форма
# = f.simple_fields_for :posts do |posts_form|
#   = posts_form.input :title
#   end
# end

# form_for @user do |f|
#   вложенная форма
# = f.simple_fields_for :posts do |posts_form|
#   Рендер вложенной формы с передачей формы в шаблон
#   = render 'posts_field', posts_form: posts_form
#   end
# end


# class Project < ActiveRecord::Base
#   has_many :tasks, inverse_of: :project, dependent: :destroy
#   accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
# end

# class Task < ActiveRecord::Base
#   belongs_to :project
# end


# = simple_form_for @project do |f|
#   = f.input :name
#   = f.input :description
#   %h3 Tasks
#   #tasks
#     = f.simple_fields_for :tasks do |task|
#       = render 'task_fields', f: task
#     .links
#       Нажатие по ссылке будет подгружать на страницу новые поля
#       = link_to_add_association 'add task', f, :tasks
#   = f.submit

# Внутри _task_fields.slim
# .nested-fields
#   = f.input :description
#   = f.input :done, as: :boolean
#   Нажатие по ссылке будет удалять поля
#   = link_to_remove_association "remove task", f
