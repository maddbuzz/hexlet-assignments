# frozen_string_literal: true

Rails.application.routes.draw do
  resources :vacancies, only: %i[index new create] do
    # BEGIN
    
    # END
  end

  root 'vacancies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
