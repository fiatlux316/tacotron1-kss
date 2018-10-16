#!/bin/bash

SRC_PATH=/home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/datasets/son_test/audio

FR_PATH=/home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/datasets/son/audio

TO_PATH=/home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/datasets/son_test/audio

find $SRC_PATH -name "*.wav" | awk -F/ '{print $NF}' | cut -d "." -f 1,2 | \
while read audio_id
do
   echo audio_id = [$audio_id]
   echo cp $FR_PATH/$audio_id.txt $TO_PATH 
   cp $FR_PATH/$audio_id.txt $TO_PATH 

done
