#!/bin/bash
#str="$(find $PWD -type f -name '.*' -print -not -name '.profile')"

#for f in "${arr[@]}"; do
#   [[ -f $f ]] && . $f --source-only || echo "$f not found"
#done 
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
A=( $SCRIPTPATH/.* )
for f in ${A[@]}
do
     [[ ! $f == "$SCRIPTPATH/.zshrc" ]] && [[ ! $f == "$SCRIPTPATH/.tmux.conf" ]] && [[ ! $f == "$SCRIPTPATH/.profile" ]] && . $f
done 
