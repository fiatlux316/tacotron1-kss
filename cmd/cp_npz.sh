#!/bin/bash

SRC_PATH=/home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/datasets/son_test/audio

FR_PATH=/home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/datasets/son/data

TO_PATH=/home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/datasets/son_test/data

find $SRC_PATH -name "*.*.wav" | awk -F/ '{print $NF}' | cut -d "." -f 1,2 | \
while read audio_id
do
   #echo audio_id = [$audio_id]
   #echo cp $FR_PATH/$audio_id.npz $TO_PATH 
   cp $FR_PATH/$audio_id.npz $TO_PATH 

done
