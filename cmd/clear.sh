#!/bin/bash

ps -ef | grep python | grep -v grep | awk '{ print $2 }' | \
while read process_id
do

    echo "kill " $process_id
    kill -9 $process_id

done
