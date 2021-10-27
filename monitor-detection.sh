#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

while true; do
    ${script_dir}/monitor-set.sh
    sleep 3
done
