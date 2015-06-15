#!/bin/bash

SLEEP_DELAY=0

echo "Flake8"
FT=$(find . -iname "*.py" | xargs flake8)
echo
echo "Unittests"
NT=$(nosetests)
echo
echo "Going to sleep for $SLEEP_DELAY second(s)"
sleep $SLEEP_DELAY
exit $[FT+NT]
