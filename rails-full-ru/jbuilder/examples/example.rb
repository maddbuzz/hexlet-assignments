# app/views/books/index.json.builder
# Jbuilder позволяет использовать синтаксис и все конструкции ruby
# .jbuilder похож на шаблоны и позволяет также погружать паршеллы из других файлов
json.array! @books, partials: "books/book", as: book

# app/views/books/_book.json.builder
json.extract! book, :title, :description, :created_at, :updated_at
json.url book_url(book, format: :json)


# app/views/books/_book.json.builder
# Поле добавляется при выполнении условия
unless book.title == 'Example'
  json.title book.title
end
# Значение поля устанавливается в зависимости от условия
json.author book.author == 'Tirion' ? boo.author : nil

# Добавляется поле, которое будет в каждом элементе списка или в структуре
json.set! :category, 'Non-Fiction'

hash = { genre: 'Fantasy' }

json.merge!(hash)

# app/views/books/index.json.builder
# Отдаётся массив с объектами с одним атрибутом
json.array! @books, :id

# app/views/books/index.json.builder
json.partial! 'books/book', books: @books

json.extract! book, :title, :description, :created_at, :updated_at
# Передача блока позволяет создавать вложенные структуры (объекты)
json.book_title do
  json.title book.title
end


class BooksController < ApplicationController
  def index
    @books = Book.all

    respond_to do |format|
      format.rss { render layout: false }
    end
  end
end

# app/views/books/index.rss.jbuilder
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Books seed"
    xml.description "Describes books title and ID"
    xml.link root_url

    @books.each do |book|
      xml.item do
        xml.title book.title
        xml.description book.description
        xml.book_url book_url(book)
      end
    end
  end
end
