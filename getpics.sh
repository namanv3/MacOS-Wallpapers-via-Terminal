#!/bin/bash

rm *.jpg *.html *.txt
user=$(whoami)
#cd ~/apod
wget http://apod.nasa.gov/apod/astropix.html --no-check-certificate
a='http://apod.nasa.gov/apod/'
grep 'href="i' astropix.html > temp.txt
b=$(awk -F "\"" '{print $2}' temp.txt)
c=$a$b
wget $c --no-check-certificate
imname=$(ls *.jpg)
for i in {0..10}; do
    echo Got the image
done
echo $imname
path=`pwd`/$(ls *.jpg)
echo 'tell application "Finder" to set desktop picture to "'"$path"'" as POSIX file'
osascript -e 'tell application "Finder" to set desktop picture to "'"$path"'" as POSIX file'
#/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/$imname
#cd ~/Desktop
