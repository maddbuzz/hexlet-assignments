bin/rails g scaffold book title:string
bin/rails g scaffold page body:text references:book
bin/rails db:migrate

bin/rails routes -g page                                                                                            1 ↵
#=>        Prefix Verb   URI Pattern                         Controller#Action
#=>    book_pages GET    /books/:book_id/pages(.:format)     pages#index
#=>               POST   /books/:book_id/pages(.:format)     pages#create
#=> new_book_page GET    /books/:book_id/pages/new(.:format) pages#new
#=>     edit_page GET    /pages/:id/edit(.:format)           pages#edit
#=>          page GET    /pages/:id(.:format)                pages#show
#=>               PATCH  /pages/:id(.:format)                pages#update
#=>               PUT    /pages/:id(.:format)                pages#update
#=>               DELETE /pages/:id(.:format)                pages#destroy
