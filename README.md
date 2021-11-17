# BBQ
Спасибо большое за посещение моего репозитория, сейчас я расскажу вам, как пользоваться моим приложением, которое помогает собраться с друзьями или коллегами на какое-либо событие.

## Новая ссылка: https://bbq-for-friends.herokuapp.com
____

### О регистрации и входе:
На моем проекте существует стандартная регистрация, а так же регистрация и вход через соц. сети (vk, fb)

![Регистрация и вход](https://user-images.githubusercontent.com/44715875/124612827-51d21c00-de7b-11eb-948b-9d85a83b37b8.gif)

### О создании события:
Пользователь может создавать событие, удалять и редактировать. Так же пользователь может ставить пин-код на событие. При подписке на событие создатель получает увидомления на почту, которую он указал. Если же пользователь оставляет комментарий, добавляет фото, то рассылка почты об обновлении в собитии идет всем, кто подписан на событие.

![Создание события](https://user-images.githubusercontent.com/44715875/124612701-37983e00-de7b-11eb-960b-c4286add833b.gif)

### О приложении:
Приложение сейчас развернуто на VPS, буду рад, если вы его посетите. Но все же поговорим о приложении:

- Развернуто на VPS [DigitalOcean](https://www.digitalocean.com/) (Ubuntu 20.04 + nginx + Phusion Passenger) через gem [Capistrano](https://github.com/capistrano/capistrano)
- База данных [PostgreSQL](https://www.postgresql.org/) для локального хранения данных
- Хранилище пользовательских данных и фотографий, организованное на [Amazon S3 AWS](https://aws.amazon.com/ru/s3/) c помощью [carrierwave](https://github.com/carrierwaveuploader/carrierwave) и [rmagic](https://github.com/rmagick/rmagick) gems
- Служба [Mailjet](https://www.mailjet.com/) для отправки электронной почты в фоновых заданиях с использованием [Resque](https://github.com/resque/resque) + [Redis](https://redis.io/)
- Авторизация в приложении через gem [pundit](https://github.com/varvet/pundit)
- [OAuth2](https://oauth.net/2/) - стандартная авторизация через аккаунты в социальных сетях Facebook и ВКонтакте
- Локализовано с помощью [I18n](http://rusrails.ru/rails-internationalization-i18n-api)
- Стили оформлены через [bootstrap](https://getbootstrap.com/)
- Фотогалерея, организованна через [lightbox](http://ashleydw.github.io/lightbox/)

### Как пользоваться:
Для того чтобы попробовать приложение у себя на локальной машине, вам нужно:
1. Склонировать моё приложение к себе на комьютер. (`git clone git@github.com:lunst97/bbq.git`)
2. Сделать `bundle` всех гемов (перед тем как делать, нужно перейти в папку приложения) 
3. Далее вам нужно прогнать все миграции командой: `rails db:migrate`
4. Чтобы приложение работало, вам нужно создать файлы `database.yml` и `secrets.yml`
- В файле `database.yml` нужно прописать следующий код:
  
  ```yml
  default: &default
    adapter: sqlite3
    encoding: unicode
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

  development:
    «: *default
    database: `name`
  
  test:
    «: *default
    database: `name`

  production:
    adapter: postgresql
    user: `user vps`
    password: `password database`
    database: `name`
    host: localhost
    port: `port`
  ```
- В файле `secrets.yml` нужно прописать следующий код:
  ```yml
  development: x
    omniauth_facebook_id: x
    omniauth_facebook_secret: x
    omniauth_vkontakte_key: x
    omniauth_vkontakte_secret: x

  production:
    secret_key_base: x
    omniauth_facebook_id: x
    omniauth_facebook_secret: x
    omniauth_vkontakte_key: x
    omniauth_vkontakte_secret: x
  ```
- Все где `x` нужно заменить на свои данные из [facebook](https://developers.facebook.com/) и [vk](https://vk.com/dev)

5. Далее нужно в корневой папке bbq создать файл `.env`
  ```yml
  MAILJET_API_KEY = ''
  MAILJET_SECRET_KEY = ''
  MAILJET_SENDER = ''
  YANDEX_API = ''
  S3_ACCESS_KEY = ''
  S3_SECRET_KEY = ''
  S3_BUCKET_NAME = ''
  ```
6. Теперь осталось просто написать команду: `rails s`\
7. И запустить `bin/webpack-dev-server` webpack сервер.

## О версиях.
`Rails` - 6.1.3.1
`Ruby` - 2.7.2

