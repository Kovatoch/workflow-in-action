#!/bin/bash
cd testdir || exit
files=(*)

BEFO=${#files[@]}
echo "$(date)Der er før oprydning oprettet $BEFO" 

