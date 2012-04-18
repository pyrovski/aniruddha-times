#!/bin/bash

echo $1 | cut -d'/' -f 2 | cut -d'-' -f1-3 > .date
#echo $1 | cut -d'-' -f4-6 > .time
echo $1 | cut -d'_' -f2-3 > .request
echo $1 | cut -d'_' -f4-  > .instance

cat $1| cut -d':' -f1 | cut -d'-' -f4 > .start
cat $1| cut -d':' -f2 | cut -d'-' -f4 > .stop
cat $1| cut -d':' -f3 > .reqID
num=`wc -l .start| cut -d' ' -f1`
list=`seq 1 $num`
rm -f .requests .instances
for i in $list; do cat .request >> .requests; cat .instance >> .instances; done
paste .requests .instances .start .stop .reqID
