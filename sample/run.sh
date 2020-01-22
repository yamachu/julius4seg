#!/bin/bash
set -e

if [ $# -lt 1 ]; then
    echo 'usage: <sp-remove,sp-segment> args...'
    echo 'see: https://github.com/yamachu/julius4seg'
    exit 1
fi

case "$1" in
    "sp-remove" ) python3 run_remover.py ${@:2:($#-1)} ;;
    "sp-segment" ) python3 run_segment.py ${@:2:($#-1)} ;;
    * ) echo "sp-remove or sp-segment only" ;;
esac
