#!/bin/bash

cd /home3/workspace/multi-Speaker-tacotron-tensorflow

echo python app.py --load_path='logs/kss_2018-08-28_23-46-20' \
  --is_korean=True

python app.py --load_path='logs/kss_2018-08-28_23-46-20' \
  --is_korean=True

cd /home3/workspace/multi-Speaker-tacotron-tensorflow/cmd
