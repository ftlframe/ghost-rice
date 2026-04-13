#!/bin/bash

CURRENT=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)
STEP=5

if [ "$CURRENT" -lt 100 ]; then
    NEW=$((CURRENT + STEP))
    if [ "$NEW" -gt 100 ]; then
        NEW=100
    fi
    pactl set-sink-volume @DEFAULT_SINK@ ${NEW}%
else
    pactl set-sink-volume @DEFAULT_SINK@ +${STEP}%
fi
