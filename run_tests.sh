#!/bin/bash

SLEEP_DELAY=0

echo "Flake8"
FT=$(find . -iname "*.py" | xargs flake8)
echo
echo "Unittests"
NT=$(nosetests)
echo
exit $[FT+NT]
