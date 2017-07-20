#!/bin/sh
#
# USAGE: check_process.sh <process_name> [<filter_1> <filter_2> ... <filter_n>]
#
#

STATUS_OK=0
STATUS_WARNING=1
STATUS_CRITICAL=2

script_name=`basename "$0"`

# Check is there is at least one argument
if [ $# -eq 0 ]; then
  echo "$STATUS_CRITICAL:0:ssh script error (at least one argument is needed)"
  exit $STATUS_CRITICAL
fi


for arg in "$@"
do
    grep_filters="$grep_filters | grep $arg"
done

# Invert-match to exclude the "ps ... | grep" command process
grep_filters="$grep_filters | grep -v grep"

# Invert-match to exclude this script process
grep_filters="$grep_filters | grep -v $script_name"

# Execute the command
cmd="ps -edlf $grep_filters | wc -l"
process_count=$(eval "$cmd")

if  [ "$process_count" -eq 0 ] ; then
        echo "$STATUS_CRITICAL:0:Process is down"
        exit $STATUS_CRITICAL
fi

echo "$STATUS_OK:0:Process is up"
exit $STATUS_OK
