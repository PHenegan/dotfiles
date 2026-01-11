#!/bin/sh

if [ $# != 1 ]; then
  echo "Script should be run with exactly one argument" >&2
  exit
fi

pw-dump | jq ".[] | select(.type == \"PipeWire:Interface:Node\" and .info.props.\"node.name\" == \"$1\") | .id"
