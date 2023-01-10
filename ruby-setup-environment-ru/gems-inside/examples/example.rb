# frozen_string_literal: true

## Утилита gem ##

# gem — пакет(архив) с библиотекой или приложением
# RubyGems — менеджер пакетов с утилитой gem для командной
# строки для установки и запаковки Ruby библиотек и приложений

# Gemfile

source :rubygems

gem "nokogiri", "1.5.0"
gem "sinatra",  "~> 1.2.6"

gem "wirble", :group => :development

group :test do
  gem "rspec",  ">= 2.6"
  gem "ffaker", ">= 1.7"
end

# Разрешение конфликтов
require 'bundler/setup'
Gemfile.lock


# Установка напрямую из GIT
gem 'rails', git: 'https://github.com/rails/rails.git'


# Установка гема, который установлен локально
gem 'rubocop', path: '../gems/rubocop'


Bundler.require(:default, Rails.env)

## RVM ##

# Минусы
# отказ от Bundler'а сразу потребует ручной установки одинаковых версий gem'ов на всех машинах:
# у каждого из разработчиков, на каждом сервере

## Homework ##
# https://gitlab.com/hexlethq/programs/rails/rails-program/-/tree/master/exercises/gems-inside
# https://gitlab.com/hexlethq/programs/rails/rails-form-builder-project

## Links ##
# https://rubygems.org/
# https://github.com/kaize/configus
# https://bundler.io/
# https://bundler.io/guides/creating_gem.html
