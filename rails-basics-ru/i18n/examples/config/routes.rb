Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/(:locale)', locale: /en|ru/ do
    root 'welcome#index'
    resources :users
  end
end
