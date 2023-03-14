# Scaffold генерирует в контроллерах методы, которые работают с несколькими форматами
class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # Также как с шаблонами, ищется во вью файл для показа в нужном формате (html, json)
  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title)
    end
end

class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all

    # respond_to переопределяет стандартное поведение
    # запрос к /books.json выводит {"hi": "books"}
    # https://apidock.com/rails/ActionController/MimeResponds/InstanceMethods/respond_to
    respond_to do |format|
      format.html do
        redirect_to root_path
      end
      format.json do
        render json: { hi: 'Books' }
      end
    end
  end
end

# format приходит в переменную params
# {"controller":"books","action":"index","format":"json"}
# bin/rails routes -g books
#    Prefix Verb   URI Pattern               Controller#Action
#     books GET    /books(.:format)          books#index
#           POST   /books(.:format)          books#create
#  new_book GET    /books/new(.:format)      books#new
# edit_book GET    /books/:id/edit(.:format) books#edit
#      book GET    /books/:id(.:format)      books#show
#           PATCH  /books/:id(.:format)      books#update
#           PUT    /books/:id(.:format)      books#update
#           DELETE /books/:id(.:format)      books#destroy


class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    # метод принимает только запросы вида /books.json и отвечает только в json
    respond_to :json

    @books = Book.all
  end
end

class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def show
    respond_to do |format|
      format.html { redirect_to root_path }
      # При преобразовании вызывается метод to_json()
      # https://apidock.com/rails/ActiveRecord/Serialization/to_json
      format.json { render json: @book.to_json, root: true }
      # root: true кладет сущность в под ключем
      # => {"book":{"id":1,"title":"example","created_at":"2021-11-10T11:57:36.381Z","updated_at":"2021-11-10T11:57:36.381Z"}}
    end
  end
end

class BooksController < ApplicationController
  # GET /books/1 or /books/1.json
  def show
    respond_to :json
    # as_json позволяет выводить только определенные поля
    render json: @book.as_json(
      root: true,
      only: :title
    )
    # => {"book":{"title":"example"}}
  end
end

Rails.application.routes.draw do
  resources :books

  # api логика лежит отдельно
  namespace :api do
    # изолируем изменения на каждой версии api
    namespace :v1 do
      resources :books
    end
  end
end
#     api_v1_books GET    /api/v1/books(.:format)          api/v1/books#index
#                  POST   /api/v1/books(.:format)          api/v1/books#create
#  new_api_v1_book GET    /api/v1/books/new(.:format)      api/v1/books#new
# edit_api_v1_book GET    /api/v1/books/:id/edit(.:format) api/v1/books#edit
#      api_v1_book GET    /api/v1/books/:id(.:format)      api/v1/books#show
#                  PATCH  /api/v1/books/:id(.:format)      api/v1/books#update
#                  PUT    /api/v1/books/:id(.:format)      api/v1/books#update
#                  DELETE /api/v1/books/:id(.:format)      api/v1/books#destroy

# app/controllers/api/application_controller.rb
# Работает для всех версий
# Перед этим необходимо подключить гем gem "responders"
class Api::ApplicationController < ApplicationController
  respond_to :json
end

# app/controllers/api/v1/application_controller.rb
class Api::V1::ApplicationController < Api::ApplicationController
end

# app/controllers/api/v1/books_controller.rb
class Api::V1::BooksController < Api::V1::ApplicationController
  # /api/v1/books.json
  def index
    @books = Books.all

    # Без гема responders выглядело бы так
    # render json: @books.as_json(only: :title)
    respond_with @books.as_json(only: :title)
  end
end

class Api::V1::BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test 'should get api index' do
    get api_books_url(format: :json)
    assert_response :success
  end

  test 'should get api show' do
    get api_book_url(@book, format: :json)
    assert_response :success
  end
end
