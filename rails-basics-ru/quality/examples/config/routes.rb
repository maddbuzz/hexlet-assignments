# frozen_string_literal: true

Rails.application.routes.draw do
  root 'notes#index'
  # get 'notes', to: 'notes#index'
  # get 'notes/show'

  resources :notes, only: %i[index show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
