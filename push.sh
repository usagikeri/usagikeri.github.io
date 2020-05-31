#!/bin/bash

t=`date '+%Y/%m/%d %H:%M'`

git add -A
git commit -m "$t"
git push origin write
