#!/bin/bash

cd ..

echo python -m datasets.kss.prepare 
python -m datasets.kss.prepare 

cd cmd
