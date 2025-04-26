#!/bin/bash

while true;
do
    docker pull bkimminich/juice-shop:latest
    docker run -d -p 127.0.0.1:3000:3000 --name juicy bkimminich/juice-shop:latest
    sleep 5
    docker rm -f juicy
    docker rmi -f bkimminich/juice-shop:latest
done