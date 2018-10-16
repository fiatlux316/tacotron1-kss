#!/bin/bash

if [ $# -ne 2 ] ;
then
  echo "Input (additional)data_path, (apply to)load_path !!"
  echo "Usage : 07.retrain_from_model.sh [son/son_test] [son_test_2018-07-25_22-12-34]"
  exit 1
fi

if [ $1 == "son_test" ] ;
then
   sum_int=20; test_int=30; chkpnt_int=50
elif [ $1 == "son" ] ;
then
   sum_int=100; test_int=100; chkpnt_int=100
else
   echo "Invalid data_path name !!"
   exit 1
fi

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow

#To restart a training from previous experiments such as logs/son-20171015:
echo python train.py --data_path=datasets/$1 \
  --summary_interval=$sum_int \
  --test_interval=$test_int \
  --checkpoint_interval=$chkpnt_int \
  --skip_path_filter=True \
  --load_path logs/$2

python train.py --data_path=datasets/$1 \
 --summary_interval=$sum_int \
 --test_interval=$test_int \
 --checkpoint_interval=$chkpnt_int \
 --skip_path_filter=True \
 --load_path logs/$2

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/cmd
