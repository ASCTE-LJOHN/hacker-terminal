#!/bin/bash

while true;
do
    pstree | nms -a -f yellow
    sleep 8
done