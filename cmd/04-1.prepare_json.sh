#!/bin/bash

cd /home3/workspace/multi-Speaker-tacotron-tensorflow

echo python -m datasets.kss.prepare 
python -m datasets.kss.prepare 

cd /home3/workspace/multi-Speaker-tacotron-tensorflow/cmd
