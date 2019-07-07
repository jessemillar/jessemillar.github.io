#!/usr/bin/env bash

rm ./*.mkv
rm ./*.mp4

for file in *.MOV;
# Video scale must be a multiple of 1920 (e.g. 640, 480, etc.)
do ffmpeg -i $file -vf scale=480:-1 ${file%.*}-scaled.mkv;
done;

ffmpeg -f concat -safe 0 -i <(for f in ./*.mkv; do echo "file '$PWD/$f'"; done) -c copy -an compilation.mp4

ffmpeg -i compilation.mp4 -vframes 1 -f image2 compilation.jpg

mv compilation.jpg ../images/compilation.jpg

rm ./*.mkv
