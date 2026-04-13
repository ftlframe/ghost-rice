#!/bin/bash
STATUS=$(playerctl status 2>/dev/null)
case "$STATUS" in
    Playing) ICON='󰏤' ;;
    Paused)  ICON='󰐊' ;;
    *)       echo ''; exit ;;
esac
playerctl metadata --format "$ICON {{artist}} - {{title}}" 2>/dev/null || echo ''
