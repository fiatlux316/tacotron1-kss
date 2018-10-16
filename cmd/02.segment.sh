#!/bin/bash

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow

python -m audio.silence --audio_pattern "./datasets/son_test/audio/*.wav" --method=pydub

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/datasets/son_test/cmd
