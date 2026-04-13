---
name: Ghost palette is color source of truth
description: The Ghost color palette is the source of truth for all configs — nvim, ghostty, tmux, sway, waybar, etc. Updated 2026-04-11.
type: feedback
originSessionId: 4467db5a-148e-423b-abf1-a7f6b057efe7
---
The Ghost color scheme is the source of truth for the entire desktop — nvim, ghostty, tmux, sway, waybar, mako, rofi, clipse, fish, starship, etc.

**Why:** User switched from Lain rice (monochrome lilac) to Ghost (gray-purple with distinct accent hues) on 2026-04-11. Key requirement: nvim must NOT be monochrome — syntax colors must be distinct and contrasted for readability.

**How to apply:** When adjusting colors anywhere, reference the Ghost palette: bg #0c0b10, text #c4bdd4, lilac #a899cc (keywords), sage green #a8c4a0 (strings), steel blue #7ea0b8 (types), ghost pink #d4a8b8 (fn calls), amber #c4a87a (warnings), teal #7aab9a (links), red #c46878 (errors), dim #584f6a, surface #17151e/#221f2b. Active WM is Sway, not Hyprland.
