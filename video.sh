#!/bin/bash
#https://d34w7g4gy10iej.cloudfront.net/video/2405/DOD_110305707/DOD_110305707-1600x900-12514k-hls_2.m3u8
# проверяем отсуствие хттп
if [[ ${1:0:4} = "http" ]]; then
  echo "delete http"
  exit
fi
# посчитать сколько блоков разделяется /
num=$(echo $1 | tr -cd / | wc -m)
# присваем количество / переменной
num=$((num-1))
#получаем название листа из переменной
res=(${1//\// })
list=(${res[$num+1]}) #название листа
#получаем путь к листу
var=1
path=(${res[0]})
while [ $var -le $num ]
do
 list1=(${res[$var]})
  path="$path"\/"$list1"
 ((var++))
done
path="https://"$path"/" #итоговы путь кслисту
#скачать лист
#wget -c "$path""$list" >> /dev/null
#Плей листа дергаем все видео фалы - формат ts:
grep .ts $list > list1.txt #лист для скачивания
grep .ts $list > list2.txt #лист для сборки
#доавбляем путь к файлам такойже как и путь к плейлисту
awk '{print "'$path'"$0}' list1.txt > new_list1.txt
#качаем файлы ts
wget -c -i new_list1.txt
#Объединяем файлы в один
cat *.ts > uotput.ts
