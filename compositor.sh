#!/bin/bash

killall -u $USER -q compfy
while pgrep -u $UID -x compfy >/dev/null; do sleep 1; done
compfy -b
