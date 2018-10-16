#!/bin/sh

if [ $# -ne 1 ] ; 
then
  echo "Input model name !!"
  echo "Usage : 01.download.sh [son|son_test]"
  exit 1
fi

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow

python -m datasets.$1.download

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/cmd
