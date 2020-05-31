#!/bin/bash

t=`date '+%Y/%m/%d %H:%M'`

git add .
git commit -m "$t"
git push origin write
