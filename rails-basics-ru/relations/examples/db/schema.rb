# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_211_215_160_318) do
  create_table 'appointments', force: :cascade do |t|
    t.datetime 'appointment_date'
    t.integer 'doctor_id'
    t.integer 'patient_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['doctor_id'], name: 'index_appointments_on_doctor_id'
    t.index ['patient_id'], name: 'index_appointments_on_patient_id'
  end

  create_table 'articles', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'published'
    t.datetime 'edited_at'
    t.integer 'author_id', null: false
    t.index ['author_id'], name: 'index_articles_on_author_id'
  end

  create_table 'articles_authors', id: false, force: :cascade do |t|
    t.integer 'articles_id'
    t.integer 'authors_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['articles_id'], name: 'index_articles_authors_on_articles_id'
    t.index ['authors_id'], name: 'index_articles_authors_on_authors_id'
  end

  create_table 'authors', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'authors_articles', id: false, force: :cascade do |t|
    t.integer 'author_id'
    t.integer 'article_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['article_id'], name: 'index_authors_articles_on_article_id'
    t.index ['author_id'], name: 'index_authors_articles_on_author_id'
  end

  create_table 'doctors', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'patients', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'articles', 'authors'
end
