#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
IMGDIR=$(dirname $DIR)/static/img/$1/$2

cd $IMGDIR
for i in *.jpg
do
	if [ -f thumb/thumb.$i ]; then
		echo "found existing thumbnail for $i"
	else
		echo "thumnail to be created for $i"
	fi
done

echo "Continue? "
if $DIR/confirm.sh; then
	mkdir thumb
	for i in *.jpg
	do
		if [ -f thumb/thumb.$i ]; then
			echo "skipping $i"
		else
			convert -thumbnail 500 $i thumb/thumb.$i
			echo "generated thumb/thumb.$i"
		fi
	done
fi
