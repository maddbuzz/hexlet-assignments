require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Show full error reports.
  # Отображать подробный вывод ошибок
  # При отключении опции рендерятся страницы public/404.html public/422.html public/500.html
  config.consider_all_requests_local = false
end
