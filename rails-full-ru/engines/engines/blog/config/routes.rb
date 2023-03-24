# frozen_string_literal: true

Blog::Engine.routes.draw do
  mount RailsStats::Engine, at: '/stats'
  root to: 'articles#index'
  resources :articles
end
