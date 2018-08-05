#!/bin/bash

user=$(whoami)
wget -q https://www.cse.iitk.ac.in/users/namanv/pics.html --no-check-certificate
a='https://www.cse.iitk.ac.in/users/namanv/'
grep '.jpg' pics.html > temp.txt
grep '.png' pics.html >> temp.txt
line=$(rl -c 1 temp.txt)            #select a random line from the file temp.txt
file=1
if [[ $line =~ [^\/]*\.jpg ]]; then
    line=${BASH_REMATCH[0]}
    echo found a jpg file
elif [[ $line =~ [^\/]*\.png ]]; then
    line=${BASH_REMATCH[0]}
    file=0
    echo found a png file
else
    echo didnt find any image
    return -1
fi
c=$a"Wallpapers/"$line
wget -q "$c" --no-check-certificate
err=$?
while [[ $err != 0 ]]; do
    echo error occured 'while' retreiving image, retrying..
    wget -q "$c" --no-check-certificate
    err=$?
done
if [[ $file = 1 ]]; then
    imname=$(ls *.jpg)
    path=`pwd`/$(ls *.jpg)
    echo the file path is $path
else
    imname=$(ls *.png)
    path=`pwd`/$(ls *.png)
    echo the file path is $path
fi

osascript -e 'tell application "Finder" to set desktop picture to "'"$path"'" as POSIX file'
rm -f *.jpg *.html *.txt *.png
#/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/$imname
#cd ~/Desktop
