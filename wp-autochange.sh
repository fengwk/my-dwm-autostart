#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

while true; do
	${script_dir}/wp-change.sh
	sleep 10m
done
