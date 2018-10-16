#!/bin/bash

if [ $# -lt 2 ] ;
then
  echo "Input model log path, text, language type  !!"
  echo "Usage : 04.synthesizer.sh [kss_2018-08-28_23-46-20] [text] [*isKorean-True/False]"
  exit 1
fi

model=$1
shift
text=$1
shift
lang=$1

cd ..

echo python synthesizer.py --load_path=logs/$model --text "$text" --is_korean=$lang

python synthesizer.py --load_path=logs/$model --text "$text" --is_korean=$lang

cd  cmd
