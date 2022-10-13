#!/bin/bash

echo "There may be a pre run instance here"
echo "If that is the one you wish to start up then enter the exact folder name"

ls -l

read -p "Instance Name: " name

mkdir $name > /dev/null
cd $name > /dev/null
PORT=8000
docker run \
             -d -p ${PORT}:8080 \
             -v "${PWD}/searxng:/etc/searxng" \
             -e "BASE_URL=http://localhost:$PORT/" \
             -e "INSTANCE_NAME=$mame" \
             --name $name  searxng/searxng > /dev/null
echo "Etept complete for searxng instace named '$name'"
