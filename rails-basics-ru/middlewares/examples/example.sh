# bin/rails c

# Инстанс Rails приложения
Rails.application

# Корневая директория приложения
Rails.application.root

# Запуск rack сервера
# Смотрит на конфиг config.ru
racup

rackup --help

# Запуск Rack с указанием пути до файла конфигурации
rackup config.ru

# Список миддлвар
# https://guides.rubyonrails.org/rails_on_rack.html#internal-middleware-stack
bin/rails middleware

