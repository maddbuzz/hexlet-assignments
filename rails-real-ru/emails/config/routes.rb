# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :users, only: %i[new create show]
  resource :session, only: %i[new create destroy]
  resource :user, only: [] do
    member do
      get :confirm
    end
  end
end
