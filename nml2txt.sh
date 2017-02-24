#!/usr/bin/env bash

FILE="$1"

IFS=$(echo -en "\n\b")

TRACK_NO=1

for TRACK in $(awk -F: '/PRIMARYKEY TYPE/ { print $NF }' $FILE | awk -F\"\> '{print $1}') ; do 
	TITLE=$(grep -w $TRACK $FILE | awk -FTITLE=\" '{ print $2 }' | awk -F\" '{print $1}' | sed 's#&amp;#\&#g')
	ARTIST=$(grep -w $TRACK $FILE | awk -FARTIST=\" '{ print $2 }' | awk -F\" '{print $1}' | sed 's#&amp;#\&#g')
	echo ${TRACK_NO}. $ARTIST - $TITLE
	let TRACK_NO=TRACK_NO+1
done
