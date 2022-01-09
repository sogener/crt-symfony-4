# Установка

1. `docker-compose up --build -d`
2. `docker-compose exec app composer install`

# Создание бд

`docker-compose exec app bin/console doctrine:migrations:migrate`

# Загрузка фикстур

`docker-compose exec app bin/console doctrine:fixtures:load`

# Генерация SSL ключей

`docker-compose exec app php bin/console lexik:jwt:generate-keypair`

# JWT токен

Jwt токен можно создать через UI `http://localhost/api/` раздел <b>Token</b>. <br>

Или через командную строку:

## Linux 
curl -X POST -H "Content-Type: application/json" http://localhost/api/login_check -d '{"username":"admin","password":"admin"}' <br>
## Windows
curl -X POST -H "Content-Type: application/json" http://localhost/api/login_check --data {"username":"admin","password":"admin"}


# Rabbitmq

`docker-compose exec app bin/console messenger:consume async -vv`

# Данные для админки

login: admin <br>
password: admin

# Доступные адреса

http://localhost/ - Главная страница <br>
http://localhost/login/ - Авторизация <br>
http://localhost/admin/ - Админка <br>
http://localhost/api/ - Api <br>


# С чем возникли трудности?
Не получилось реализовать проверку доступа энд-понитов через JWT токен
