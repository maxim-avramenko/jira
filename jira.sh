#!/usr/bin/env bash

SCRIPT="$0"
showHelp() {
    echo "Commands:"
    echo "===================================================================================================="
    echo "up                - start JIRA"
    echo "ps                - list of working containers"
    echo "down              - stop JIRA"
    echo "restart           - restart JIRA"
    echo "build             - build docker containers for JIRA"
    echo "build-nocache     - force build docker containers for JIRA without docker cached images"
    echo "db-backup         - s3cli backup database to Amazon S3"
    echo "db-restore        - s3cli restore database form Amazon S3"
    echo "===================================================================================================="

}
FUNCTION=
if [ ! -z $1 ]; then
    FUNCTION="$1"
fi

build-nocache(){
    echo "Building JIRA docker images without cache."
    docker-compose build --no-cache
}
build(){
    echo "Building JIRA docker images with cache."
    docker-compose build
}
ps(){
    echo "Container status:"
    docker-compose ps
}
up(){
    echo "Start JIRA"
    docker-compose up -d
    ps
    echo 'Please, see logs above to find out container status.'
}
down(){
    echo "Stop JIRA"
    docker-compose down
    ps
    echo 'Please, see logs above to find out container status.'
}
restart(){
    echo "Restart JIRA"
    docker-compose down
    docker-compose up -d
    ps
    echo 'Please, see logs above to find out container status.'
}
check-config(){
    echo "Config status:"
    docker-compose config
}
db-backup(){
    echo "Staring backup DB to Amazon S3 cloud"
    docker run --rm --env-file ./docker/env/s3.env --env-file ./docker/env/db-backup.env --volumes-from yupedocker_db_1 --name dockup tutum/dockup:latest
}
db-restore(){
    echo "Staring backup DB to Amazon S3 cloud"
    docker run --rm --env-file ./docker/env/s3.env --env-file ./docker/env/db-restore.env --volumes-from yupedocker_db_1 --name dockup tutum/dockup:latest
}
case "$1" in
-h|--help)
    showHelp
    ;;
*)
    if [ ! -z $(type -t $FUNCTION | grep function) ]; then
        $1
    else
        showHelp
    fi
esac
