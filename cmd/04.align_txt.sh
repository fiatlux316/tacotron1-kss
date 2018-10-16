#!/bin/bash

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow

python -m recognition.alignment --recognition_path "./datasets/son_test/recognition.json" --score_threshold=0.5

cd /home2/workspace/tensorflow/multi-Speaker-tacotron-tensorflow/datasets/son_test/cmd
