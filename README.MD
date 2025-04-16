# Данные о поездках чикагского такси (проект dbt)
Источник - датасет `bigquery-public-data.chicago_taxi_trips.taxi_trips`

## Перед запуском
1) Скачайте проект:
```commandline
git clone https://github.com/949027/chicago-taxi
```
2) Создайте [сервисный аккаунт Google Cloud](https://cloud.google.com/iam/docs/service-accounts-create)
3) Установите переменные окружения в вашей системе
- `GC_PROJECT` — ваш проект на Google Cloud
- `GC_BQ_DATASET` - ваш датасет в BigQuery (Google Cloud)
- `GC_SERVICE_ACCOUNT_KEYFILE_PATH` - путь к файлу-ключу сервисного аккаунта Google Cloud  

\* Если ваш аккаунт не подключен к биллингу Goggle Cloud — замените в директории models в sql-файлах строчку `materialized='incremental'` на `materialized='table'` для отключения инкрементальности.

## Запуск
1) [Python3](https://www.python.org/downloads/) должен быть уже установлен.
2) Рекомендуется использовать [virtualenv/venv](https://docs.python.org/3/library/venv.html) для изоляции проекта.
3) Затем используйте pip (или pip3) для установки зависимостей:
```commandline
pip install -r requirements.txt
```
4) Выполните 
```commandline
dbt debug
```
При ошибках обратитесь к [документации](https://docs.getdbt.com/docs/core/connect-data-platform/bigquery-setup)

5) Выполните 
```commandline
dbt run
```
6) Проверьте ваш датасет BigQuery на наличие новых данных. Для генерации документации выполните
```commandline
dbt docs generate
dbt docs serve
```

## Цели проекта
Код написан в качестве тестового задания.
