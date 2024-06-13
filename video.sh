#!/bin/bash
#https://d34w7g4gy10iej.cloudfront.net/video/2405/DOD_110305707/DOD_110305707-1600x900-12514k-hls_2.m3u8
num=$(echo $1 | tr -cd / | wc -m)
num=$((num-1))
#pl=$(echo $1 | awk -F/ '{print res}')
#wget -c $1 >> /dev/null
res=(${1//\// })
list=(${res[$num]})
var=0
echo $v
echo $num
while [ $var -le $num ]
do
 list=(${res[$var]})
 echo $list "\"
 ((var++))
done



