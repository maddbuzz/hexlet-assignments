# frozen_string_literal: true

Article.order(created_at: :desc)
Article.order(created_at: :desc)
Article.where(published: true).order(created_at: :desc)

article = Article.find(1)

# https://guides.rubyonrails.org/association_basics.html#the-belongs-to-association
article.author

Article.delete_all

article = Article.new

article.author # nil

author = article.build_author
# <Author:0x000055d15f486e18 id: nil, name: nil, created_at: nil, updated_at: nil>

# Для связанной модели можно создать отдельные параметры
def author_params
  params.require(:article).require(:author).permit(:name)
end

author = Author.create(author_params)
@article = Article.create(article_params)
# Разные способы связать две модели
@article.author = author
@article.author_id = author.id
@article = Article.create(article_params.merge(author_id: author.id))
@article.create_author(author_params)

Article.count
Author.count
Author.delete(1)
Author.last

article = Article.last

article.author # Author

author = Author.last

# Для one-to-oen связи
author.article # Article

# one-to-many
author.articles # Article::ActiveRecord_Associations_CollectionProxy
# Забрать определенные поля
author.articles.pluck(:title)
author.articles.pluck(:title, :id)

# one to one
class Author < ApplicationRecord
  has_one :article
end

# one to many
class Author < ApplicationRecord
  has_many :articles
end

# many to many
class Author < ApplicationRecord
  has_and_belongs_to_many :articles
end

doctor = Doctor.create(name: 'Fred')
patient = Patient.create(name: 'Alice')
appointment = Appointment.create(doctor:, patient:, appointment_date: Time.now.tomorrow)

appointment.doctor # Doctor name: 'Fred'
appointment.patient # Doctor name: 'Alice'

doctor.patients.pluck(:name) # ["Alice"]

# Создание связанной модели

article = Article.new
author = article.build_author(name: 'Bob')

author = Author.find(1)

article = author.articles.build(title: 'Article 1', body: 'Article body') # аналог Article.new

author.save # сохраняет основную и связанные модели

# При создании таблицы m2m связи имена моделей должны быть в алфавитном порядке (соглашение о наименовании)
class CreateArticlesAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :articles_authors, id: false do |t|
      t.belongs_to :articles
      t.belongs_to :authors
      t.timestamps
    end
  end
end
