# BBQ
Спасибо большое за посещение моего репозитория, сейчас я расскажу вам, как пользоваться моим приложением, которое помогает собраться с друзьями или коллегами на какое-либо событие.
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
