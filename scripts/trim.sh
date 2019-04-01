#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
IMGDIR=$(dirname $DIR)/static/img/$1/$2
post="$(dirname $DIR)/content/post/$1-$2.md"
imgs=()

for filename in $IMGDIR/*.jpg; do
    base=$(basename $filename)
    if ! [ "$(cat $post | grep $base)" ]; then
        imgs=( "${imgs[@]}" "$base" )
    fi
done

echo These images not found in $post
for img in ${imgs[@]}; do
    echo $img
done

echo Delete these unused files?

if confirm; then
    for img in ${imgs[@]}; do
        rm $IMGDIR/$img
    done
fi
