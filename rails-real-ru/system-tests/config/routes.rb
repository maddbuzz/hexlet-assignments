# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  resources :posts do
    scope module: :posts do
      resources :comments, only: %i[edit create update destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
