# Запуск сервера
bin/rails s

# Создание контроллера с экшеном. Добавляется get роут
bin/rails g controller pages index
# Отмена изменений генератора
bin/rails d controller pages index

# Создание котроллера с экшеном без создания роута
bin/rails g controller pages index --skip-routes

# список роутов содержащих pages
bin/rails routes -g pages
