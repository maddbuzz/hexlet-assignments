# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsStats::Engine => '/stats'
end
