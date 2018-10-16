#!/bin/bash

if [ $# -ne 1 ] ;
then
   echo "input step !!"
   exit 1
fi

find . -name "model.ckpt*" -print | \
while read fname
do
   num=`echo $fname | cut -d"." -f3 | cut -d"-" -f2`
   if [[ $num -lt $1 ]] ;
   then
      echo "deleting ..." $fname
      rm $fname
   fi

done
