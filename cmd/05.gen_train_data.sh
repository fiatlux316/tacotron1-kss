#!/bin/bash

if [ $# -ne 1 ] ;
then
  echo "Input model name !!"
  echo "Usage : 05.gen_train_data.sh [son|son_test|LJSpeech_1_1|kss]"
  exit 1
fi

cd /home3/workspace/multi-Speaker-tacotron-tensorflow

echo python -m datasets.generate_data ./datasets/$1/alignment.json
python -m datasets.generate_data ./datasets/$1/alignment.json

cd /home3/workspace/multi-Speaker-tacotron-tensorflow/cmd
