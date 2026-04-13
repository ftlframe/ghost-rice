#!/bin/bash
# Keybind cheatsheet — displays in wofi dmenu mode (searchable)

cat <<'EOF' | wofi --dmenu --prompt "Keybinds" --width 600 --height 500 --lines 20
--- General ---
Super + Enter         Terminal (ghostty)
Super + d             App launcher (wofi)
Super + q             Kill window
Super + p             Power menu (wlogout)
Super + e             File explorer (ranger)
Super + c             Clipboard (clipse)
Super + n             Notification center
Super + Shift + n     Close all notifications
Super + Shift + c     Reload sway config
Super + Shift + e     Exit sway
Super + /             This help menu

--- Navigation ---
Super + h/j/k/l      Focus left/down/up/right
Super + Arrow keys    Focus left/down/up/right
Super + Shift + h/j/k/l   Move window
Super + Shift + Arrows     Move window
Super + Tab           Switch window (swayr)
Super + Shift + Tab   Switch workspace (swayr)

--- Workspaces ---
Super + 1-0           Switch to workspace 1-10
Super + Shift + 1-0   Move window to workspace 1-10
Super + [ / ]         Prev / next workspace
Super + x             Toggle last workspace
Mouse side buttons    Prev / next workspace
Super + scroll        Prev / next workspace

--- Layout ---
Super + b             Split horizontal
Super + v             Split vertical
Super + s             Stacking layout
Super + w             Tabbed layout
Super + t             Toggle split
Super + f             Fullscreen
Super + Shift + Space Toggle floating
Super + Space         Toggle focus (tile/float)
Super + a             Focus parent

--- Resize ---
Super + r             Enter resize mode (hjkl/arrows, Esc to exit)
Super + Ctrl + h/j/k/l         Resize 30px
Super + Ctrl + Shift + h/j/k/l Resize 100px

--- Scratchpad ---
Super + Shift + -     Move to scratchpad
Super + -             Show scratchpad

--- Media ---
Volume Up/Down        Adjust volume
Mute                  Toggle mute
Mic Mute              Toggle mic
Play/Pause            Media play/pause
Next/Prev             Media next/prev

--- Screenshot ---
Print                 Screenshot (flameshot)

--- Apps ---
Super + Shift + m     Strawberry (music)
EOF
