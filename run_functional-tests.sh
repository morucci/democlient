#!/bin/bash

sleep 150

set -x

DEMOLIB="http://softwarefactory.enovance.com/r/demolib"
DEMOLIBPATH=${DEMOLIBPATH:-""}

virt=$(mktemp -d)
virtualenv $virt
source $virt/bin/activate

if [ -z "$DEMOLIBPATH" ]; then
    # Use demolib master
    clonedirtemp=$(mktemp -d)
    git clone $DEMOLIB $clonedirtemp/demolib
    cd $clonedirtemp/demolib
    python setup.py install
    cd -
else
    # Use local demolib
    cd $DEMOLIBPATH
    python setup.py install
    cd -
fi

python setup.py install
ret=$(democlient 1)

deactivate

[ "$ret" = "420" ] && exit 0 || exit 1
