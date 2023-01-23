#!/bin/sh

cd `dirname $0`

while true; do
    echo "変換したい動画のパスを入力してください: "
    read SOURCE_PATH

    if [ -n "$SOURCE_PATH" ]; then
        break
    fi
done

while true; do
    echo
    echo "フレームレートを入力してください: "
    read FRAME_RATE

    if [ -n "$FRAME_RATE" ]; then
        break
    fi
done

while true; do
    echo
    echo "縦横のサイズを入力してください (1280:720): "
    read VIDEO_SIZE

    if [ -n "$VIDEO_SIZE" ]; then
        break
    fi
done

while true; do
    echo
    echo "画質を設定してください (0~100): "
    read QUALITY

    if [ -n "$QUALITY" ]; then
        break
    fi
done

ffmpeg -i "$SOURCE_PATH" -vcodec libwebp -filter:v fps=fps=$FRAME_RATE -lossless 0 -compression_level 6 -q:v $QUALITY -loop 1 -preset default -s $VIDEO_SIZE -an -vsync 0 "$SOURCE_PATH.webp"
