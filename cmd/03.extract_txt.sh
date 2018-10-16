#!/bin/bash

/home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/datasets/son_test/cmd/cp_txt.sh

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow
echo google cloud speech api connecting ...
python -m recognition.google --audio_pattern "./datasets/son_test/audio/*.*.wav"

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/datasets/son_test

cat recognition.json | sed "s/son/son_test/" > recognition.json.1
rm recognition.json
mv recognition.json.1 recognition.json

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/datasets/son_test/cmd
