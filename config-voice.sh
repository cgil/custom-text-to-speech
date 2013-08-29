#!/bin/sh

cd ./sound
for file in $( ls ); do
	if [[ $file == *.flac ]]; then
		echo "1) Processing file: $file"
		fileName=`wget -q -U "Mozilla/5.0" --post-file $file --header="Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=en-us&client=chromium" |
		sed 's/.*utterance":"//' | sed 's/","confidence.*//'`
		echo "2) Transcriped fileName: $fileName for file: $file"
		if [[ ! -z "$fileName" ]]; then	#if fileName is set and not empty
			safeName=${fileName// /_}
			if [[ $safeName =~ .*_.* ]]; then	
   				mv $file ./final/phrase/${safeName}.wav	#save the phrase
   			else 
   				mv $file ./final/${safeName}.wav	#save the word
			fi
		else	#file came back as empty, so remove it
			rm $file
		fi
	fi
done