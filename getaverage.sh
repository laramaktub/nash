#!/bin/bash
rm prueba.txt

FILES=cropimages/*
for filename in $FILES
do

count=$(convert $filename -format "%[fx:floor(255*u.r)],%[fx:floor(255*u.g)],%[fx:floor(255*u.b)]" info:)
printf "`echo $filename``echo ","``echo $count`\n" >> prueba.txt
echo -e "\n" >> prueba.txt  
done


cat prueba.txt | sed '/^[[:space:]]*$/d' > average.txt
rm prueba.txt
