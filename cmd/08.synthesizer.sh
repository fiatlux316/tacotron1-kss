#!/bin/bash

if [ $# -lt 2 ] ;
then
  echo "Input model log path, text, language type  !!"
  echo "Usage : 08.synthesizer.sh [son_2018-07-25_10-25-40] [text] [*isKorean-True/False]"
  exit 1
fi

model=$1
shift
text=$1
shift
lang=$1

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow

echo python synthesizer.py --load_path=logs/$model --text "$text" --is_korean=$lang

python synthesizer.py --load_path=logs/$model --text "$text" --is_korean=$lang

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/cmd
