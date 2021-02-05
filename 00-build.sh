#!/bin/bash

SCRIPT=$0
LANG=$1
PRJ=$2

function usage(){
    cat << EOS 
Usage: sh $SCRIPT {js|ts}  {project_name}
    args:
        language js or ts
EOS
}

if [[ $# != 2 ]]; then
    usage
    exit 2
fi

echo "PRJ=$PRJ" >> .env


case $LANG in
    js);;
    ts);;
    *) usage; exit 2;;
esac

docker-compose build 

case $LANG in
    js) docker-compose run --rm client  sh -c "npm install -g create-react-app && create-react-app ${PRJ}" ;;
    ts) docker-compose run --rm client  sh -c "npm install -g create-react-app && create-react-app ${PRJ}" --template typescript ;;
    *) usage; exit 2;;
esac
