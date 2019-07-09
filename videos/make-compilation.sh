#!/usr/bin/env bash

rm compilation.mp4

for file in *.MOV
# Video scale must be a multiple of 1920 (e.g. 640, 480, etc.)
do
	ffmpeg -i $file -vf scale=640:-1 ${file%.*}-scaled.mp4
	ffmpeg -i ${file%.*}-scaled.mp4 -vf crop=640:320 ${file%.*}-cropped.mp4
done

for f in ./*-cropped.mp4
do
	echo "file '$f'" >> files.txt
done

ffmpeg -f concat -safe 0 -i files.txt -c copy -an compilation-temp.mp4

ffmpeg -i compilation-temp.mp4 -c copy -movflags faststart compilation.mp4

ffmpeg -i compilation.mp4 -vframes 1 -f image2 compilation.jpg

mv compilation.jpg ../images/compilation.jpg

rm *-scaled.mp4
rm *-cropped.mp4
rm compilation-temp.mp4
rm files.txt
