#!/bin/sh

# Ew....we don't really want to dump the log to /home/dpikora/ - but it will have to do for now
jstest --event /dev/input/by-id/usb-Harmonix_Music_Harmonix_Drum_Kit_for_Xbox_360_00111F9F-joystick | /home/dpikora/Desktop/Tools\ and\ Toys/drums/read_jstest_output.pl 2>&1 >> /home/dpikora/dans_drums.log &



