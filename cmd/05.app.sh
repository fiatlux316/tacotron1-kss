#!/bin/bash

cd ..

echo python app.py --load_path='logs/kss_2018-08-28_23-46-20' \
  --is_korean=True

python app.py --load_path='logs/kss_2018-08-28_23-46-20' \
  --is_korean=True

cd  cmd
