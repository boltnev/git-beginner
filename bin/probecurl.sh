#!/bin/sh
curl -L -w "@`dirname $0`/curlformat.txt" -o /dev/null -s $1
