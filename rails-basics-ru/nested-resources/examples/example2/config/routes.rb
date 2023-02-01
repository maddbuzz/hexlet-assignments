# frozen_string_literal: true

Rails.application.routes.draw do
  # Контроллеры и вьюхи должны находиться в модуле Web
  # Задаётся только модуль, имена роутов и пути не изменяются
  scope module: :web do
    root 'books#index'
    resources :books, except: [:index] do
      resources :pages, only: %i[index new create]
    end

    resources :books, except: [:index], shallow: true do
      resources :pages, only: %i[show edit update destroy]
    end
  end
end
