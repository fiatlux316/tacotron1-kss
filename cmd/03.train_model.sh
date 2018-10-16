#!/bin/bash

if [ $# -lt 1 ] ;
then
  echo "Input model name !!"
  echo "Usage : 03.train_model.sh  [path_to_checkpoint]"
  exit 1
fi

if [ "$1" == "" ] ;
then
   load_path=None 
else
   load_path=logs/$1
fi

cd ..

python train.py --data_path=datasets/kss \
 --summary_interval=1000 \
 --test_interval=1000 \
 --checkpoint_interval=1000 \
 --skip_path_filter=True \
 --num_test_per_speaker=2 \
 --load_path=$load_path

cd  cmd
