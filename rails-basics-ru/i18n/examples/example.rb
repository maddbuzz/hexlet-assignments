# https://github.com/ruby-i18n/i18n
# https://github.com/svenfuchs/rails-i18n

# Узнать дефолтную локаль
I18n.default_locale

# Различные методы определять и изменять локаль динамически
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  around_action :set_locale_param

  private

  def default_url_options
    { locale: I18n.locale }
  end

  # Локаль может быть передана как в query param, так и в url
  # http://localhost:3000/users?locale=ru
  # http://localhost:3000/ru/users
  def set_locale_param(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def set_locale_param_with_cookie(&action)
    locale = params[:locale] || cookies[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
    cookies[:locale] = I18n.locale
  end

  def set_locale_domain(&action)
    # http://en.example.com
    # http://ru.example.com
    locale = request.subdomains.first

    I18n.locale = if I18n.available_locales.include?(locale.to_sym)
                    locale
                  else
                    I18n.default_locale
                  end
  end

  def set_locale_headers
    logger.debug(request.env['HTTP_ACCEPT_LANGUAGE'])
    locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first

    logger.debug("LOCALE: #{locale}")

    I18n.locale = if I18n.available_locales.include?(locale.to_sym)
                    locale
                  else
                    I18n.default_locale
                  end
  end
end


# config/routes.rb
Rails.application.routes.draw do
  scope '/(:locale)', locale: /en|ru/ do
    root 'welcome#index'
    resources :users
  end
end

# config/application.rb
require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module I18nApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Задать локаль по умолчанию
    # https://guides.rubyonrails.org/i18n.html#configure-the-i18n-module
    config.I18n.default_locale = :ru # :en

    # Разрешенные локали
    config.I18n.available_locales = [:en, :ru]
    # Указать путь, откуда будут загружаться локали
    # Rails.root возвращает полный путь до проекта
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  end
end

# =========================

# Хелперы

translate(:welcome_title)
translate('welcome_title')
I18n.translate('welcome_title')
I18n.t('welcome_title')
t('welcome_title')

# en.users.all
t('users.all')
t('all', scope: 'users')
# Если перевод не найдет, то будет подставлен дефолтный
t('all', default: 'All Users')
# Если перевод не найдет, то будет подставлен дефолтный по ключу
t('non_exists.all', default: :'fallback.all_users')
# Перевод ищется, пока не найдется
t('non_exists.all', default: [:'fallback.all_users', 'Backup users 2'])

# Сработает соглашение и сгенерируется ключа автоматом.
# Например если вызов происходит в app/views/users/index.html.erb, то сформируется ключ ru.users.index.all
t('.all')

User.model_name.human(count: 100)
# ru:
#   activerecord:
#     # Переводы названий моделей
#     models:
#       # Плюрализация (множественное и единственное число в переводах)
#       user:
#         one: Пользователь
#         other: Пользователи

# Плюрализация
# https://guides.rubyonrails.org/i18n.html#pluralization
t('.created_count', count: User.count)

# Передача переменной
t('.created_count', count: @count)

# Локализация дат
# https://guides.rubyonrails.org/i18n.html#adding-date-time-formats
l(Time.now, format: :short)

distance_of_time_in_words(Time.now)

# Локализация валюты, процентов
# https://guides.rubyonrails.org/i18n.html#action-view-helper-methods
number_to_currency(5)
number_to_percentage(5)

# Библиотека для перевода динамических данных
# https://github.com/shioyama/mobility

# Локализация и simple_form
# https://github.com/heartcombo/simple_form#i18n

# ru:
#   helpers:
#     submit:
#       user:
#         create: "Создать пользователя"

# полезная библиотека для показа в stdout загружаемых ключей переводов
# https://github.com/fphilipe/i18n-debug
