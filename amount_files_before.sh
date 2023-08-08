#!/bin/bash 
BEFO=`ls /tmp/testdir/ | wc -l`
echo "`date`Der er før oprydning oprettet $BEFO"  >> /tmp/test_of_cleanup_scripts.log

