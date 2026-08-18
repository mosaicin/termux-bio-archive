# Архив открытых вопросов — Rails для Termux

Это минимальный Ruby on Rails 7.2 прототип для архива биографий, источников, права на ответ и открытых вопросов. Проект не является судом, обвинительным реестром или инструментом самосуда. Непроверенные сведения должны иметь статус `unverified`, а художественные материалы — флаг `fictional: true`.

## Запуск в Termux

В Termux установите Ruby, SQLite и Git:

```sh
pkg update -y
pkg install ruby sqlite git build-essential -y
gem install bundler rails -v 7.2.2.1 --no-document
git clone <URL-РЕПОЗИТОРИЯ>
cd termux_bio_archive
bundle install
bundle exec rails db:prepare
bundle exec rails db:seed
bundle exec rails server -b 0.0.0.0 -p 3000
```

Откройте `http://127.0.0.1:3000`. Для доступа с другого устройства в одной сети используйте IP телефона вместо `127.0.0.1`.

## Редакционные правила

Публикуйте только проверяемые утверждения и ссылки на первоисточники. Для спорного материала используйте статусы `draft`, `unverified`, `reviewed` и `published`. Ответы сохраняются как `pending` и не публикуются автоматически. Открытый вопрос не является обвинением. Реальные имена и чувствительные данные следует публиковать только при законном основании, общественном интересе и возможности ответа.

## Быстрая проверка

```sh
bundle exec rails db:prepare
bundle exec rails test
bundle exec rails routes
```
