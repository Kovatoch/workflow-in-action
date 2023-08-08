#!/bin/bash 
AFT=`ls /tmp/testdir/ | wc -l`
echo "`date`Der er efter oprydning $AFT"  >> /tmp/test_of_cleanup_scripts.log

