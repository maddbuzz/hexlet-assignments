# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get 'signup', to: 'users#new'

  resource :session, only: %i[new create destroy]

  resources :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
