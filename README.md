# JIRA in Docker containers #
----------------------------------
Репозиторий предназначен для запуска JIRA в Docker контейнерах.

Для работы необходимы:
- Docker
- docker-compose
- Git

### Commands: ###

    "up                - start JIRA"
    "ps                - list of working containers"
    "down              - stop JIRA"
    "restart           - restart JIRA"
    "build             - build docker containers for JIRA"
    "build-nocache     - force build docker containers for JIRA without docker cached images"
    "db-backup         - s3cli backup database to Amazon S3"
    "db-restore        - s3cli restore database form Amazon S3"

Помощь
------
Документация
- [Docker](https://docs.docker.com/)
- [docker-compose](https://docs.docker.com/compose/overview/)
- [JIRA](https://support.atlassian.com/)
