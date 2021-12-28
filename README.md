# Установка

1. `docker-compose up --build -d`
2. `docker-compose exec app composer install`

# Создание бд

`docker-compose exec app bin/console doctrine:migrations:migrate`

# Загрузка фикстур

`docker-compose exec app bin/console --env=test doctrine:fixtures:load`

# rabbitmq

`docker-compose exec app bin/console messenger:consume async -vv`

# Данные для админки

login: admin <br>
password: admin

# Сайт доступен по адресу

http://localhost/
