#!/bin/bash
if [ ! -d /tmp/testdir ]
   then
    mkdir /tmp/testdir
fi
cd /tmp/testdir

for ((n=1;n<=49;n++)); 
  do
    touch -d "60 days ago" JanFile$n 
done
    touch JanFile50
    
