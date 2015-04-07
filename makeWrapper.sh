#!/bin/bash

##############################
# A make wrapper for vim.
##############################

# Override the makeprg vim variable to this script. Then if then MAKEDIR
# environment variable is set to a path make will run inside that path.

echo $MAKEDIR

if [[ -z $MAKEDIR ]]; then
	echo "no MAKEDIR set"
	make $@
	exit
fi

cd $MAKEDIR
make $@
