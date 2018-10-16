#!/bin/bash

cd ..

echo python -m datasets.generate_data ./datasets/kss/alignment.json
python -m datasets.generate_data ./datasets/kss/alignment.json

cd cmd
