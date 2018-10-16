#!/bin/bash

max_step="0"

find . -name "model.ckpt*index" -print | xargs ls -ltr | \
while read fname
do
   num=`echo $fname | cut -d"." -f3 | cut -d"-" -f2`
   max_step=$num
   echo $max_step > ./max_step.tmp
done

max_step=`cat ./max_step.tmp` 

echo "max_step=[$max_step]"

find . -name "model.ckpt*" -print | \
while read fname
do
   num=`echo $fname | cut -d"." -f3 | cut -d"-" -f2`
   if [[ $num -lt $max_step ]] ;
   then
      echo "deleting ..." $fname
      rm $fname
   fi
done
