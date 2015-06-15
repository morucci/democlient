#!/bin/bash

set -x

DEMOLIB="https://github.com/morucci/demolib.git"
DEMOLIBPATH=${DEMOLIBPATH:-""}

virt=$(mktemp -d)
virtualenv $virt
source $virt/bin/activate

if [ -z "$DEMOLIBPATH" ]; then
    # demolib cannot be found locally fecth it from github
    clonedirtemp=$(mktemp -d)
    git clone $DEMOLIB $clonedirtemp/demolib
    DEMOLIBPATH=$clonedirtemp
fi

cd $DEMOLIBPATH
python setup.py install
cd -

python setup.py install
ret=$(democlient 1)

deactivate

[ "$ret" = "420" ] && exit 0 || exit 1
