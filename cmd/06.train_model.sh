#!/bin/bash

if [ $# -lt 1 ] ;
then
  echo "Input model name !!"
  echo "Usage : 06.train_model.sh [son|son_test|LJSpeech_1_1|kss] [*path_to_checkpoint]"
  exit 1
fi

if [ $1 == "son_test" ] ;
then
   sum_int=50; test_int=50; chkpnt_int=50
else
   sum_int=500; test_int=500; chkpnt_int=500
fi


if [ "$2" == "" ] ;
then
   load_path=None 
else
   load_path=logs/$2
fi

cd /home3/workspace/multi-Speaker-tacotron-tensorflow

# single-speaker model
echo python train.py --data_path=datasets/$1 \
  --summary_interval=$sum_int \
  --test_interval=$test_int \
  --checkpoint_interval=$chkpnt_int \
  --skip_path_filter=True \
  --num_test_per_speaker=2 \
  --load_path=$load_path

python train.py --data_path=datasets/$1 \
 --summary_interval=$sum_int \
 --test_interval=$test_int \
 --checkpoint_interval=$chkpnt_int \
 --skip_path_filter=True \
 --num_test_per_speaker=2 \
 --load_path=$load_path

# multi-speaker model
# after change `model_type` in `hparams.py` to `deepvoice` or `simple`
#python train.py --data_path=datasets/son1,datasets/son2

cd /home3/workspace/multi-Speaker-tacotron-tensorflow/cmd
