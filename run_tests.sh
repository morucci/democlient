#!/bin/bash

echo "Flake8"
find . -iname "*.py" | xargs flake8
echo
echo "Unittests"
nosetests
echo
