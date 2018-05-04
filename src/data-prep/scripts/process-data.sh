#!/bin/bash

# Convert data to line-delimited GeoJSON text file
echo 'Processing data into features.txt'
python3 /usr/src/scripts/create-habitat-line-delimited-json-file.py
