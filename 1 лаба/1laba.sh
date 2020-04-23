#!/bin/bash
echo "Введите путь папки, которую следует анализировать:"
read f1
folder_for_the_analysys=$f1
echo "Введите путь папки,в которую будет помещена таблица с результатами анализа:"
read f2
folder_for_the_result=$f2
echo "filename; type; modification date; size in bytes; duration; format; access rights" > $folder_for_the_result/result.csv

analysys()								#рекурсивная функция
{

(
for i in $1/*; do							#Перебор файлов

if [[ -d $i ]]; then							#Проверка, существует ли файл, и является ли он директорией.
analysys $i
continue
fi

name=$(basename "$i")							#Имя файла
filename=${name%.*}

type1=${name#*.}; if [ "$type1" = "$filename" ]; then type1=''; fi	#расширение файла, если оно есть
type2=$(file --mime-type -b "$i")                                       #описание расширения файла

mod=$(stat --format=%.10y "$i")						#дата изменения

size=$(stat --format=%s "$i")         					#Размер в байтах

dur=$(mediainfo "$i" --Output="General;%Duration/String%")              #Длительность аудио или видео

if [ "${type2%/*}" = "image" ]; then format=$type1; else format=""; fi	#Формат(для изображений)

access_rights=$(ls "$i" -l)						#Права доступа

echo "$filename;$type1($type2);$mod;$size;$dur;$format;$access_rights"  #Заполнение строки в таблице

done
)>>$folder_for_the_result/result.csv

}

analysys $folder_for_the_analysys					#запуск функции для выбранной дирректрории 
