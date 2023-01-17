Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  # get 'pages/about', to: 'pages#about'
  # get 'pages/term_of_service', to: 'pages#term_of_service'
  # page_path	GET	/pages/:id(.:format) pages#show
  # ресурсный роутинг позволяет создавать роуты динамически
  resources :pages, only: :show
end
