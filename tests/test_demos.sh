#!/bin/bash

if [ $3 == true ]; then
export VERSION=nightly
fi

cd startai
pip install -e .

cd ../demos
mkdir .startai
touch .startai/key.pem
echo -n "$1" > .startai/key.pem

# install dependencies
pip install -r requirements.txt >/dev/null 2>&1

# run test
if [ $4 == true ]; then
    echo "PATH : $2"
    python3 tests/main.py "$2"
else
    echo "Running the README tests"
    pip install -r tests/requirements.txt
    python3 -m pytest tests/test_README.py
