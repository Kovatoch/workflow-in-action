#!/bin/bash
#AFT=$(ls testdir/ | wc -l)

cd testdir || exit
files=(*)

AFT=${#files[@]}

AFTDATE=$(date)
echo "${AFTDATE} Der er efter oprydning ${AFT}"

