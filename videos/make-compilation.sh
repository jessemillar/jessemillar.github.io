#!/usr/bin/env bash

rm compilation.mp4

for file in *.MOV
# Video scale must be a multiple of 1920 (e.g. 640, 480, etc.)
do
	ffmpeg -i $file -vf scale=640:-1 ${file%.*}-scaled.mp4
	ffmpeg -i ${file%.*}-scaled.mp4 -filter:v "crop=640:320" ${file%.*}-cropped.mp4
	ffmpeg -i ${file%.*}-cropped.mp4 -q 0 ${file%.*}-final.mts
done

for f in ./*-final.mts
do
	echo "file '$f'" >> files.txt
done

ffmpeg -f concat -safe 0 -i files.txt -c copy -an compilation.mp4

ffmpeg -i compilation.mp4 -vframes 1 -f image2 compilation.jpg

mv compilation.jpg ../images/compilation.jpg

rm *-scaled.mp4
rm *-cropped.mp4
rm *-final.mts
rm files.txt
