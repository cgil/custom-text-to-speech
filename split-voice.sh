#!/bin/sh

rec -r 16000 -2 -s -p silence 1 0.1 1% 1 10:00 1% | \
     sox -p ./sound/voice.flac silence 1 0.1 1% 1 0.1 1% : \
     newfile : restart

#sox voice.flac out.wav silence 1 0.1 1% 1 0.1 1% : newfile : restart
