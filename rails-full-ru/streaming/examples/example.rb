class BooksController < ApplicationController
  def index
    @books = Book.all

    # Включение стриминга шаблонов
    # https://api.rubyonrails.org/classes/ActionController/Streaming.html
    render stream: true
  end
end

# при запроще с помощью Curl данные будут отдаваться постепенно
class HelloController < ActionController::Base
  include ActionController::Live

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers["Last-Modified"] = Time.current.httpdate
    100.times {
      response.stream.write "hello world\n"
      sleep 1
    }
  ensure
    response.stream.close
  end
end

# https://api.rubyonrails.org/v5.1.7/classes/ActionController/DataStreaming.html
class BooksController < ActionController::Base
  include ActionController::Live

  def send_file
    # Используется для отправки готового файла
    send_file(Rails.root.join('public', '404.html'), filename: 'hello.txt')
  end

  # https://api.rubyonrails.org/v5.1.7/classes/ActionController/DataStreaming.html
  def send_data
    # Отправляется стриминговый файл, которого изначально нет
    data = 'Hello'
    send_data(data, filename: 'hello.txt')
  end
end
