# Файлы

Научимся загружать файлы в облачные сервисы.

## Ссылки

* Документация [Active Storage](https://edgeguides.rubyonrails.org/active_storage_overview.html)
* Инструкция [S3 для Heroku](https://devcenter.heroku.com/articles/s3)
* [Active Storage Validations](https://github.com/igorkasyanchuk/active_storage_validations) — валидатор файлов

## Работа с облачным провайдером

В этом задании можно использовать любой S3 совместимый хостинг. Если по каким-то причинам один из них не подходит вам — используйте другой.

### Регистрация в Amazon Web Services

Зарегистрируйтесь на Amazon Web Services. Создайте новый бакет, создайте секретные токены n *Access Key ID* и *Secret Access Key*.

Для работы с AWS S3 приложению необходимы следующие переменные окружения

```env
SECRET_KEY_BASE=test
RAILS_ENV=production # для запуска приложения в production режиме
RACK_ENV=production
S3_ACCESS_KEY_ID= # Получено в AWS
S3_BUCKET= # например rails-files-homework
S3_REGION= # например eu-central-1
S3_SECRET_ACCESS_KEY= # Получено в AWS
```

## Регистрация Yandex.Cloud

Заведите аккаунт в Yandex.Cloud и создайте [по инструкции](https://cloud.yandex.ru/docs/storage/operations/) облачное хранилище (Object Storage). Оно полностью совместимо с AWS S3, вам также потребуется ID и ключ (это данные от сервисного аккаунта, который необходимо будет создать)

## Настройка приложения

### Gemfile

Добавьте необходимые гемы и выполните установку

```ruby
gem 'active_storage_validations'
gem 'aws-sdk-s3'
gem 'file_validators'
gem 'image_processing'
```

Создайте миграцию для ActiveStorage.

```bash
bin/rails active_storage:install
```

### app/models/vehicle.rb

* Добавьте в модель связь `image` с загружаемым изображением.
* Добавьте валидацию для загрузки изображения. Изображения должно быть обязательным, размер - до 5 мегабайт. Разрешенные форматы — png, jpg, jpeg.

### config/storage.yml

Добавьте в *config/storage.yml* конфиг для работы с файлами. При локальной работе файлы будут храниться на диске, а в боевом окружении — в облачном хранилище.

```yml
test:
  service: Disk
  root: <%= Rails.root.join("tmp/storage") %>

local:
  service: Disk
  root: <%= Rails.root.join("storage") %>

amazon:
  service: S3
  access_key_id: <%= ENV['S3_ACCESS_KEY_ID'] %>
  secret_access_key: <%= ENV['S3_SECRET_ACCESS_KEY'] %>
  region: <%= ENV['S3_REGION'] %>
  bucket: <%= ENV['S3_BUCKET'] %>

yandex:
  service: S3
  access_key_id: <%= ENV['S3_ACCESS_KEY_ID'] %>
  secret_access_key: <%= ENV['S3_SECRET_ACCESS_KEY'] %>
  region: ru-central1
  bucket: <%= ENV['S3_BUCKET'] %>
  endpoint: 'https://storage.yandexcloud.net'
  ```

### config/environments/production.rb

Установите использование необходимого сервиса в продакшен окружении:

```ruby
config.active_storage.service = :amazon # :yandex если используется Yandex.Cloud
```

### app/views/vehicles/_form.html.slim

Добавьте в форму возможность загружать изображения.

## Деплой

Выполните деплой приложения на PaaS (Heroku или Railway) или запустите приложение в режиме production локально и проверьте загрузку файлов в интерфейсе облачного хранилища (файлы должны отображаться и быть доступны в приложении).

Чтобы выполнить деплой домашнего задания на Heroku вам потребуется скопировать задание в другую директорию, так как для работы приложения на Heroku требуется закоммиченный в репозитории файл *Gemfile.lock*. Не забудьте проверить, что все актуальные изменения у вас будут в домашнем задании, при отправке на проверку.
