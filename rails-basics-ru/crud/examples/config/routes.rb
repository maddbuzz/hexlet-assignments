Rails.application.routes.draw do
  # Кастомные страницы для ошибок
  # Также изменяем в config/application.rb конфиг
  # https://guides.rubyonrails.org/v4.2.0/action_controller_overview.html#custom-errors-page
  get '/404', to: 'errors#not_found'
  get "/500", to: "errors#server_error"

  root 'articles#index'
  # Лучше использовать only, так как белые списки проще для понимания
  resources :articles, only: [:show, :new, :create, :edit, :update, :destroy]
end
