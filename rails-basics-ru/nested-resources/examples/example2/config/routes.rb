Rails.application.routes.draw do
  # Контроллеры и вьюхи должны находиться в модуле Web
  # Задаётся только модуль, имена роутов и пути не изменяются
  scope module: :web do
    root 'books#index'
    resources :books, except: [:index] do
      resources :pages, only: [:index, :new, :create]
    end

    resources :books, except: [:index], shallow: true do
      resources :pages, only: [:show, :edit, :update, :destroy]
    end
  end
end
