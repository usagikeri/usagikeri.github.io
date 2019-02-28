#!/bin/bash

git clone -b write https://github.com/usagikeri/usagikeri.github.io.git tmp
cp -rp tmp/public/* .
rm -rf tmp

t=`date '+%Y/%m/%d %H:%M'`

git add .
git commit -m "$t"
git push origin master
