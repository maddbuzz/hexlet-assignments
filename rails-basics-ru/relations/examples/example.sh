bin/rails g migration remove_author_from_articles
bin/rails db:migrate
bin/rails g model author name
bin/rails db:migrate
bin/rails g migration add_author_to_books author:references
# Удаление миграции
bin/rails d migration add_author_to_books author:references

# После добавления belongs_to :author в Article
# Сработает соглашение об наименованиях
bin/rails g migration add_author_to_articles author:references

bin/rails g model doctor name
bin/rails g model patient name

# При создании таблицы m2m связи имена моделей должны быть в алфавитном порядке (соглашение о наименовании)
bin/rails g migration create_articles_authors
