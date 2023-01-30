Rails.application.routes.draw do
  scope module: :web do
    root 'books#index'
    resources :books, except: [:index] do
      resources :pages, only: [:index, :new, :create]
      # добавляется метод для каждого экземпляра ресурса
      post :publish
    end
  end
end

# bin/rails routes -g publish
#       Prefix Verb   URI Pattern                       Controller#Action
# book_publish POST   /books/:book_id/publish(.:format) web/books#publish


Rails.application.routes.draw do
  scope module: :web do
    root 'books#index'
    resources :books, except: [:index] do
      # добавляется метод для каждого экземпляра ресурса
      collection do
        # Метод один для всех данных ресурсов
        post :publish
      end
    end
  end
end

# bin/rails routes -g publish
# =>        Prefix Verb   URI Pattern               Controller#Action
# => publish_books POST   /books/publish(.:format)  web/books#publish

Rails.application.routes.draw do
  scope module: :web do
    root 'books#index'
    resources :books, except: [:index] do
      # добавляется метод для каждого экземпляра ресурса
      member do
        post :publish
      end
    end
  end
end

# bin/rails routes -g publish
# =>       Prefix Verb URI Pattern                  Controller#Action
# => publish_book POST /books/:id/publish(.:format) web/books#publish
