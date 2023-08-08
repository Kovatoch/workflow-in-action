#!/bin/bash
if [ ! -d testdir ]
   then
    mkdir testdir
fi
cd testdir

for ((n=1;n<=49;n++));   
do     
    touch -d "60 days ago" JanFile$n  
done
    touch JanFile50
    
