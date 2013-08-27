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

# wget -q -U "Mozilla/5.0" --post-file ./sound/message.flac --header="Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=en-us&client=chromium" > message.ret
#  echo "3 SED Extract recognized text" 
#  cat message.ret | sed 's/.*utterance":"//' | sed 's/","confidence.*//' > message.txt
#  echo "4 Remove Temporary Files"
#  #rm ./sound/message.flac
#  rm message.ret
#  echo "5 Show Text "
#  cat message.txt
