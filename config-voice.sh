#!/bin/sh

cd ./sound
for file in $( ls ); do
	if [[ $file == *.flac ]]; then
		echo $file
		fileName=`wget -q -U "Mozilla/5.0" --post-file $file --header="Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=en-us&client=chromium" |
		sed 's/.*utterance":"//' | sed 's/","confidence.*//'`
		echo $fileName
		mv $file ./final/${fileName}.wav
	fi
done
