# frozen_string_literal: true

Blog::Engine.routes.draw do
  root 'articles#index'
  resources :articles
end
