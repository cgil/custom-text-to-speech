#!/bin/sh

cd ./text
for file in $( ls ); do
	if [[ $file == *.txt ]]; then
		while IFS='{ }' read word; done	#read file word by word
		   echo $word
		done < $file
	fi
done