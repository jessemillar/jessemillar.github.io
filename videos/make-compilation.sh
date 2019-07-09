#!/usr/bin/env bash

rm compilation.mp4

for file in *.MOV
# Video scale must be a multiple of 1920 (e.g. 640, 480, etc.)
do
	ffmpeg -i $file -vf scale=640:-1 ${file%.*}-scaled.mp4
	ffmpeg -i ${file%.*}-scaled.mp4 -filter:v "crop=640:360" ${file%.*}-cropped.mkv
done

ffmpeg -f concat -safe 0 -i <(for f in ./*.mkv; do echo "file '$PWD/$f'"; done) -c copy -an compilation-temp.mp4

ffmpeg -i compilation-temp.mp4 -c copy -movflags faststart compilation.mp4

ffmpeg -i compilation.mp4 -vframes 1 -f image2 compilation.jpg

mv compilation.jpg ../images/compilation.jpg

#rm *-scaled.mp4
#rm *.mkv
#rm compilation-temp.mp4
