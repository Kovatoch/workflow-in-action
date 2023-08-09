#!/bin/bash
AFT=$(ls testdir/ | wc -l)
AFTDATE=$(date)
echo "${AFTDATE} Der er efter oprydning ${AFT}"

