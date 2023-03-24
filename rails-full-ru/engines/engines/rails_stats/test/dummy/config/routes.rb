# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsStats::Engine => '/rails_stats'
end
