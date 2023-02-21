
# require_relative 'boot'

# В config/application.rb добавляем работу с SimpleForm
# ENV['RANSACK_FORM_BUILDER'] = '::SimpleForm::FormBuilder'

# require 'rails/all'

# class PeopleController < ApplicationController
#   def index
#     @q = Person.ransack(params[:q])
#     @people = @q.result
#   end
# end

# Можем использовать хелпер формы. Однако этот хелпер не может подтягивать стили Bootstrap, поэтому классы и лейблы нужно писать самим
# Если в конфиге подключен Simpleform для ransack, используем его
# = search_form_for @q do |f|
#   .row.my-2
#     .col-5
#       Можем отключить показ лейблов
#       Ransack ищет по полям в БД
#       Для фильтров необходимо использовать определенные имена. Например, Если поле "содержит" текст, то имя инпута формы - column_cont
#       https://github.com/activerecord-hackery/ransack#search-matchers
#       = f.input :name_cont, label: false
#     .col-4
#   Для вывода списка состояний можно выполнить map() на списке состояний.
#       = f.input :aasm_state_eq, as: :select, collection: Post.aasm.states.map(&:name), label: false
#     .col-3
#       = f.submit 'Search', class: 'btn btn-primary me-2'
#       = link_to 'Reset', url_for, class: 'btn btn-outline-primary'
