#!/bin/sh

if [ $# != 1 ]; then
  echo "Script should be run with exactly one argument" >&2
  exit
fi

node_id=$($HOME/.config/hypr/scripts/get_node_id.sh $1)
wpctl set-mute $node_id toggle

# This is really stupid but it's also so funny
# Play different noise based on whether or not the device was previously muted
muted=$(wpctl get-volume $node_id | grep [MUTED])
if [ "$muted" ]; then
  pw-play $HOME/.config/hypr/resources/discord-mute.mp3 --volume 0.4
else
  pw-play $HOME/.config/hypr/resources/discord-unmute.mp3 --volume 0.4
fi

