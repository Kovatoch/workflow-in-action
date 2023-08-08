#!/bin/bash
find /tmp/testdir/  -mtime +30 -exec rm {} \;
