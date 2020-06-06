#!/bin/bash
A=( "$HOME"/.dotfiles/.* )
for f in ${A[@]}
do
	[[ -f $f ]] && . $f
done 
