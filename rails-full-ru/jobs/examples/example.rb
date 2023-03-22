# bin/rails g job fetch_books_titles
#       create  test/jobs/fetch_books_titles_job_test.rb
#       create  app/jobs/fetch_books_titles_job.rb

# app/jobs/fetch_books_titles_job.rb
class FetchBooksTitlesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end
end

# test/jobs/fetch_books_titles_job_test.rb
require "test_helper"

class FetchBooksTitlesJobTest < ActiveJob::TestCase
  # test "the truth" do
  #   assert true
  # end
end


# app/jobs/fetch_books_titles_job.rb
class FetchBooksTitlesJob < ApplicationJob
  queue_as :default

  def perform
    titles = Book.pluck(:title)
    pp titles
  end
end

# bin/rails g job fetch_books_titles --queue urgent
# app/jobs/fetch_books_titles_job.rb
class FetchBooksTitlesJob < ApplicationJob
  # --queue задает очередь в которую попадает задача
  queue_as :urgent

  def perform(*args)
    # Do something later
  end
end

# Вызов джобы
FetchBooksTitlesJob.perform_later # Джоба выполняется после выполнения основного процесса
FetchBooksTitlesJob.perform_now # Джоба запускается непосредственно

# Выполнить через 5 секунд
FetchBooksTitlesJob.set(wait: 5.seconds).perform_later
# Запустить через 10 секунд, в определенное время
FetchBooksTitlesJob.set(wait_until: Time.now + 10.seconds).perform_later

# config/application.rb
require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Books
  class Application < Rails::Application
    config.load_defaults 6.1

    # https://api.rubyonrails.org/classes/ActiveJob/QueueAdapters.html
    config.active_job.queue_adapter = :sidekiq
    config.active_job_queue_name_prefix = Rails.new
    config.active_job_queue_name_delimiter = '.'
  end
end

# Запуск задачи в заданной очереди
FetchBooksTitlesJob.set(queue: :low_priority).perform_later

# app/jobs/fetch_books_titles_job.rb
class FetchBooksTitlesJob < ApplicationJob
  # Очередь задается динамически
  # queue_as { cond ? :default : :high_priority }

  def perform
    titles = Book.pluck(:title)
    pp titles
  end
end

# Доступные коллбеки
# https://edgeguides.rubyonrails.org/active_job_basics.html#available-callbacks
before_enqueue
around_enqueue
after_enqueue
before_perform
around_perform
after_perform

# app/jobs/fetch_books_titles_job.rb
class FetchBooksTitlesJob < ApplicationJob
  around_perform :improve_output

  def perform
    titles = Book.pluck(:title)
    pp titles
  end

  def improve_output
    pp '*******************************************'
    yield
    pp '*******************************************'
  end
end

# https://guides.rubyonrails.org/action_mailer_basics.html
# bin/rails g mailer new_book
#       create  app/mailers/new_book_mailer.rb
#       create    app/views/new_book_mailer
#       create    test/mailers/new_book_mailer_test.rb
#       create    test/mailers/previews/new_book_mailer_preview.rb

# app/mailers/new_book_mailer.rb
class NewBookMailer < ApplicationMailer
  default from: 'book@example.com'

  def new_book
    mail(
      to: 'user@examplle.com',
      subject: 'New book'
    )
  end
end

# app/views/new_book_mailer/new_book.txt.erb
New book has been created

# Отправка письма
NewBookMailer.new_book.deliver_later
NewBookMailer.new_book.deliver_now



# https://github.com/mperham/sidekiq
# Для работы sidekiq требуется запущенный redis
# Для выполнения задач требуется запущенный sidekiq
# bundle exec sidekiq

# Gemfile
gem 'sidekiq'

# config/application.rb
require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Books
  class Application < Rails::Application
    config.load_defaults 6.1

    # https://api.rubyonrails.org/classes/ActiveJob/QueueAdapters.html
    config.active_job.queue_adapter = :sidekiq
  end
end

# config/sidekiq.yml
# В этомф файле хранятся настройки sidekiq
# :concurrency: 2
# :logfile: ./log/sidekiq.log
# :queues:
#   - default
#   - mailers

# Open http://localhost:3000/sidekiq

# app/jobs/fetch_books_titles_job.rb
class FetchBooksTitlesJob
  #
  include Sidekiq::Worker

  def perform
    titles = Book.pluck(:title)
    pp titles
  end

  def improve_output
    pp '*******************************************'
    yield
    pp '*******************************************'
  end
end

# Для асинхронных джоб с sidekiq изменяется способ их вызова
FetchBooksTitlesJob.perform_async
FetchBooksTitlesJob.perform_in(5.seconds)

# ActiveJob perform_now / perform_later
# Sidekiq perform_async / perform_in
