#!/bin/bash
find testdir/  -mtime +30 -exec rm {} \;
