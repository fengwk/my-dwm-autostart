#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

while true
do
    ${script_dir}/dwm-status-refresh.sh
    sleep 1
done
