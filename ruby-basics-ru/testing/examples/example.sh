### Запуск тестов
## Обычный запуск тестов
ruby example_test.rb

## Запуск с детальным логирование выполнения
ruby ex=begin  =endample_test.rb -v

## Запуск с паттерном названия метода
ruby example_test.rb -n test_one

## Запуск с исключающим паттерном названия метода
ruby example_test.rb -e test_one

## Запуск с детерминированным сидом для псевдослучайного генератора
ruby example_test.rb -s 10000
