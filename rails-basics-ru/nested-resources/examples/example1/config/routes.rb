Rails.application.routes.draw do
  root 'books#index'
  # родительный ID передётса из пути
  # GET books/:book_id/pages
  # GET books/:book_id/pages/new
  # POST books/:book_id/pages
  resources :books, except: [:index] do
    resources :pages, only: [:index, :new, :create]
  end

  resources :books, except: [:index], shallow: true do
    resources :pages, only: [:show, :edit, :update, :destroy]
  end
end
