# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  # BEGIN
  # root 'tasks#index'
  # resources :tasks, only: %i[show new create edit update destroy]
  resources :tasks
  # END
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
