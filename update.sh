#!/bin/bash

hugo

t=`date '+%Y/%m/%d %H:%M'`

git add .
git commit -m "$t"
git push origin write
git checkout master
