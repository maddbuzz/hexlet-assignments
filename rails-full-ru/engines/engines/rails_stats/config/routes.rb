# frozen_string_literal: true

RailsStats::Engine.routes.draw do
  # BEGIN
  mount Blog::Engine, at: '/blog'
  root to: 'stats#index'
  # END
end
